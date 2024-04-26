// ignore_for_file: must_be_immutable

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_iwish_practice/utils/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  double? height;
  double? width;
  int? maxLines = 1;
  InputField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.height,
      this.width,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: AppTextStyle.textFieldTitle,
        ),
        SizedBox(
          height: 7.5.h,
        ),
        Container(
          padding: EdgeInsets.only(left: 17.w),
          width: width == 0 ? 327.w : width,
          height: height == 0 ? 45.h : height,
          decoration: BoxDecoration(
            border: Border.all(color: ThemeColors.txtFieldBorderColor),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: TextField(
            controller: controller,
            style: AppTextStyle.textFieldLabel,
            showCursor: false,
            maxLines: maxLines == 0 ? 1 : maxLines,
            textAlignVertical:
                TextAlignVertical.center, // Align text vertically in the middle
            decoration: InputDecoration(
              // contentPadding:                  EdgeInsets.symmetric(vertical: 0), // Remove vertical padding
              border: InputBorder.none,
              hintText: 'Enter $hintText',
              hintStyle: AppTextStyle.textFieldLabel,
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
        ),
      ],
    );
  }
}
