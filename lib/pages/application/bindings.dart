import 'package:chat_app/pages/application/controller.dart';
import 'package:chat_app/pages/contact/controller.dart';
import 'package:chat_app/pages/message/controller.dart';
import 'package:chat_app/pages/profile/index.dart';
import 'package:get/get.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    Get.lazyPut<ContactController>(() => ContactController());
    Get.lazyPut<MessageController>(() => MessageController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
