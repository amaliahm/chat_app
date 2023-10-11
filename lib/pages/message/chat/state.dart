// ignore_for_file: non_constant_identifier_names

import 'package:chat_app/common/entities/msgcontent.dart';
import 'package:get/get.dart';

class ChatState {
  RxList<Msgcontent> msgcontentList = <Msgcontent>[].obs;
  var to_uid = "".obs;
  var to_name = "".obs;
  var to_avatar = "".obs;
  var pseudo = "pseudo".obs;
}
