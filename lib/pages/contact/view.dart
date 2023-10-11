// ignore_for_file: unused_element, no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:chat_app/common/values/colors.dart';
import 'package:chat_app/common/widgets/app.dart';
import 'package:chat_app/pages/contact/controller.dart';
import 'package:chat_app/pages/contact/widgets/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppBar _buildAppBar() {
      return transparentAppBar(
        title: Text(
          "Contact",
          style: TextStyle(
            color: AppColors.primaryBackground,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: const ContactList(),
    );
  }
}
