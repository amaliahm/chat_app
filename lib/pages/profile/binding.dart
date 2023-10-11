import 'package:chat_app/pages/profile/controller.dart';
import 'package:get/get.dart';

class ProfileBinging implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
