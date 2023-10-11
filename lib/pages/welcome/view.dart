// ignore_for_file: non_constant_identifier_names

import 'package:chat_app/pages/welcome/controller.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SizedBox(
          width: 360.w,
          height: 700.h,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              first_three_screen(),
              three_dots(),
            ],
          ),
        ),
      ),
    );
  }

  three_dots() {
    return Positioned(
      bottom: 45,
      child: DotsIndicator(
        position: controller.state.index.value,
        dotsCount: 3,
        reversed: false,
        mainAxisAlignment: MainAxisAlignment.center,
        decorator: DotsDecorator(
            size: const Size.square(9),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )),
      ),
    );
  }

  first_three_screen() {
    return PageView(
      scrollDirection: Axis.horizontal,
      reverse: false,
      onPageChanged: (index) {
        controller.changePage(index);
      },
      controller: PageController(
        initialPage: 0,
        keepPage: false,
        viewportFraction: 1,
      ),
      pageSnapping: true,
      physics: const ClampingScrollPhysics(),
      children: [
        tango(image_name: "assets/images/banner1.png"),
        tango(image_name: "assets/images/banner2.png"),
        tango(image_name: "assets/images/banner3.png", isChild: true),
      ],
    );
  }

  tango({required String image_name, bool isChild = false}) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(image_name),
      )),
      child: isChild
          ? Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  bottom: 90,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.handleSignIn();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.white))),
                    child: const Text("Login"),
                  ),
                ),
              ],
            )
          : Container(),
    );
  }
}
