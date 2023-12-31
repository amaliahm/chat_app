// ignore_for_file: avoid_print, non_constant_identifier_names, avoid_init_to_null, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:chat_app/common/entities/msgcontent.dart';
import 'package:chat_app/common/store/user.dart';
import 'package:chat_app/common/utils/security.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'index.dart';

class ChatController extends GetxController {
  ChatController();
  ChatState state = ChatState();
  var doc_id = null;
  final textController = TextEditingController();
  ScrollController msgScrolling = ScrollController();
  FocusNode contentNode = FocusNode();
  final user_id = UserStore.to.token;
  final db = FirebaseFirestore.instance;
  var listener;

  File? _photo;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickerFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickerFile != null) {
      _photo = File(pickerFile.path);
      uploadFile();
    }
  }

  Future getImgUrl(String name) async {
    final spaceRef = FirebaseStorage.instance.ref("chat").child(name);
    var str = await spaceRef.getDownloadURL();
    return str ?? "";
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = getRandomString(15) + extension(_photo!.path);
    try {
      final ref = FirebaseStorage.instance.ref("chat").child(fileName);
      await ref.putFile(_photo!).snapshotEvents.listen((event) async {
        switch (event.state) {
          case TaskState.running:
            break;
          case TaskState.paused:
            break;
          case TaskState.success:
            String imgUrl = await getImgUrl(fileName);
            sendImageMessage(imgUrl);
            break;
          case TaskState.canceled:
          // TODO: Handle this case.
          case TaskState.error:
          // TODO: Handle this case.
        }
      });
    } catch (e) {
      print("there's an error $e");
    }
  }

  sendImageMessage(String url) async {
    final content = Msgcontent(
      uid: user_id,
      content: url,
      type: "image",
      addtime: Timestamp.now(),
    );
    await db
        .collection("message")
        .doc(doc_id)
        .collection("msglist")
        .withConverter(
            fromFirestore: Msgcontent.fromFirestore,
            toFirestore: (Msgcontent msgcontect, option) =>
                msgcontect.toFirestore())
        .add(content)
        .then((DocumentReference doc) {
      textController.clear();
      Get.focusScope?.unfocus();
    });
    await db
        .collection("message")
        .doc(doc_id)
        .update({"last_msg": " [image] ", "last_time": Timestamp.now()});
  }

  @override
  void onInit() {
    super.onInit();
    var data = Get.parameters;
    doc_id = data['doc_id'];
    state.to_uid.value = data["to_uid"] ?? "";
    state.to_name.value = data["to_name"] ?? "";
    state.to_avatar.value = data["to_avatar"] ?? "";
  }

  sendMessage() async {
    String sendContent = textController.text;
    final content = Msgcontent(
      uid: user_id,
      content: sendContent,
      type: "text",
      addtime: Timestamp.now(),
    );
    await db
        .collection("message")
        .doc(doc_id)
        .collection("msglist")
        .withConverter(
            fromFirestore: Msgcontent.fromFirestore,
            toFirestore: (Msgcontent msgcontect, option) =>
                msgcontect.toFirestore())
        .add(content)
        .then((DocumentReference doc) {
      textController.clear();
      Get.focusScope?.unfocus();
    });
    await db
        .collection("message")
        .doc(doc_id)
        .update({"last_msg": sendContent, "last_time": Timestamp.now()});
  }

  @override
  void onReady() {
    super.onReady();
    var messages = db
        .collection("message")
        .doc(doc_id)
        .collection("msglist")
        .withConverter(
            fromFirestore: Msgcontent.fromFirestore,
            toFirestore: (Msgcontent msgcontent, options) =>
                msgcontent.toFirestore())
        .orderBy("addtime", descending: false);
    state.msgcontentList.clear();
    listener = messages.snapshots().listen((event) {
      for (var change in event.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added:
            if (change.doc.data() != null) {
              state.msgcontentList.insert(0, change.doc.data()!);
            }
            break;
          case DocumentChangeType.modified:
            break;
          case DocumentChangeType.removed:
            break;
        }
      }
    }, onError: (error) => print("Listen failed $error"));
  }

  @override
  void dispose() {
    msgScrolling.dispose();
    listener.cancel();
    super.dispose();
  }
}
