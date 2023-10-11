// ignore_for_file: avoid_print

import 'package:chat_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'index.dart';

class ApplicationController extends GetxController {
  final state = ApplicationState();
  ApplicationController();
  late final List<String> tabTitles;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTabs;

  void handPageChanged(int index) {
    state.page = index;
  }

  void handleNavBarTab(int index) {
    pageController.jumpToPage(index);
  }

  @override
  void onInit() {
    super.onInit();
    tabTitles = ['Chat', 'Contact', "Profile"];
    bottomTabs = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: SizedBox(
          height: 30.w,
          child: Image(
            image: const AssetImage("assets/icons/chat-bubble-square.png"),
            height: 20.w,
            width: 20.w,
          ),
        ),
        activeIcon: SizedBox(
          height: 30.w,
          child: Image(
            image: const AssetImage("assets/icons/chat-bubble-square-1.png"),
            height: 20.w,
            width: 20.w,
          ),
        ),
        label: 'Chat',
        backgroundColor: AppColors.primaryBackground,
      ),
      BottomNavigationBarItem(
        icon: SizedBox(
          height: 30.w,
          child: Image(
            image: const AssetImage("assets/icons/contact-book-1.png"),
            height: 20.w,
            width: 20.w,
          ),
        ),
        activeIcon: SizedBox(
          height: 30.w,
          child: Image(
            image: const AssetImage("assets/icons/contact-book-2.png"),
            height: 20.w,
            width: 20.w,
          ),
        ),
        label: 'Contact',
        backgroundColor: AppColors.primaryBackground,
      ),
      BottomNavigationBarItem(
        icon: SizedBox(
          height: 30.w,
          child: Image(
            image: const AssetImage("assets/icons/user-sync-online-in-person-2.png"),
            height: 20.w,
            width: 20.w,
          ),
        ),
        activeIcon: SizedBox(
          height: 30.w,
          child: Image(
            image: const AssetImage("assets/icons/user-arrows-account-switch.png"),
            height: 20.w,
            width: 20.w,
          ),
        ),
        label: 'Profile',
        backgroundColor: AppColors.primaryBackground,
      ),
    ];
    pageController = PageController(initialPage: state.page);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
