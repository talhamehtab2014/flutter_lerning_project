import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_text_style.dart';
import '../utils/colors.dart';

class MoreSettingTileWidget extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;
  const MoreSettingTileWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.moreSettingTitleText,
              ),
              Text(
                description,
                style: AppTextStyle.moreSettingDescriptionText,
              ),
            ],
          ),
          Container(
            /*padding: EdgeInsets.zero,
              width: 20.w,
              height: 20.h,*/
            decoration: BoxDecoration(),
            child: Icon(
              Icons.arrow_forward_ios,
              color: ThemeColors.mainTitle,
              size: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
