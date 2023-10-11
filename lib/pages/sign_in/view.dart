// ignore_for_file: unused_element, no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:chat_app/pages/sign_in/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../common/values/colors.dart';
import '../../common/values/shadows.dart';
import '../../common/widgets/button.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  container_one() {
    return Container(
      width: 76.w,
      height: 76.h,
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: 76.w,
              decoration: const BoxDecoration(
                color: AppColors.primaryBackground,
                boxShadow: [
                  Shadows.primaryShadow,
                ],
                borderRadius: BorderRadius.all(Radius.circular(35)),
              ),
            ),
          ),
          Positioned(
            child: Image.asset(
              "assets/images/ic_launcher.png",
              width: 76.w,
              height: 76.h,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  container_two() {
    return Container(
      margin: EdgeInsets.only(
        top: 15.h,
        bottom: 15.h,
      ),
      child: Text(
        "Let's chat",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.thirdElement,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            height: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildLogo() {
      return Container(
        width: 110.w,
        margin: EdgeInsets.only(top: 84.h),
        child: Column(
          children: [
            container_one(),
            container_two(),
          ],
        ),
      );
    }

    Widget _buildThirdPartyLogin() {
      return Container(
        width: 295.w,
        margin: EdgeInsets.only(bottom: 280.h),
        child: Column(
          children: [
            Text(
              "Sign in with social networks",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30.h,
                left: 50.h,
                right: 50.w,
              ),
              child: btnFlatButtonWidget(
                onPressed: () {
                  controller.handleSignIn();
                },
                width: 200.w,
                height: 55.w,
                title: "Google Login",
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildThirdPartyLogin(),
          ],
        ),
      ),
    );
  }
}
