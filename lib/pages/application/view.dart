// ignore_for_file: unused_element, no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:chat_app/common/values/colors.dart';
import 'package:chat_app/pages/application/controller.dart';
import 'package:chat_app/pages/contact/index.dart';
import 'package:chat_app/pages/message/view.dart';
import 'package:chat_app/pages/profile/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationPage extends GetView<ApplicationController> {
  const ApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _buildPageView() {
      return PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: controller.handPageChanged,
        children: const [
          MessagePage(),
          ContactPage(),
          ProfilePage(),
        ],
      );
    }

    Widget _buildBottomNavigationBar() {
      return Obx(
        () => BottomNavigationBar(
          items: controller.bottomTabs,
          currentIndex: controller.state.page,
          type: BottomNavigationBarType.fixed,
          onTap: controller.handleNavBarTab,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          unselectedItemColor: AppColors.tabBarElement,
          selectedItemColor: AppColors.thirdElementText,
        )
      );
    }

    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
