import 'package:flutter/material.dart';
import 'package:flutter_iwish_practice/modules/interest/controllers/user_intreset_controller.dart';
import 'package:flutter_iwish_practice/utils/app_assets.dart';
import 'package:flutter_iwish_practice/utils/app_text_style.dart';
import 'package:flutter_iwish_practice/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class UserInterest extends StatelessWidget {
  UserInterestController userInterestController =
      Get.put(UserInterestController());
  static const id = "/userInterest";

  UserInterest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(
      () {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 43.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 35.w),
              child: Text(
                'Select your interests ',
                style: AppTextStyle.header1,
              ),
            ),
            SizedBox(
              height: 82.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.w),
              child: Wrap(
                spacing: 15.w, // spacing between the chips
                runSpacing: 19.h, // spacing between the lines of chips
                children: List.generate(
                  userInterestController.categories.length,
                  (int index) {
                    return FilterChip(
                      showCheckmark: false,
                      selectedColor: ThemeColors.toggleSwitchBgColor,
                      labelStyle: AppTextStyle.userIntrest,
                      labelPadding: EdgeInsets.only(
                        left: 8.w,
                        top: 5.h,
                        bottom: 5.h,
                      ),
                      side: const BorderSide(
                        style: BorderStyle.none,
                      ),
                      avatar: const CircleAvatar(
                        backgroundImage: AssetImage(AppAssets.sampleAvatar),
                      ),
                      backgroundColor: ThemeColors.socialSignInButton,
                      label: Text(userInterestController.categories[index]),
                      selected: userInterestController.selectedCategories
                          .contains(userInterestController.categories[index]),
                      onSelected: (bool selected) {
                        userInterestController.toggleCategory(
                            userInterestController.categories[index]);
                      },
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        );
      },
    ));
  }
}
