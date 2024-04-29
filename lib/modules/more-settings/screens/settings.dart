import 'package:flutter/material.dart';
import 'package:flutter_iwish_practice/utils/app_text_style.dart';
import 'package:flutter_iwish_practice/widgets/back_button.dart';
import 'package:flutter_iwish_practice/widgets/more_setting_tile_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/colors.dart';
import '../../../utils/routes.dart';
import '../../../widgets/primaryButton.dart';

class Settings extends StatelessWidget {
  static const id = "/Setting";
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 23.w, right: 23.w, bottom: 41.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 49.h,
                ),
                Row(
                  children: [
                    CustomBackButton(),
                    SizedBox(
                      width: 97.w,
                    ),
                    Text(
                      'Settings',
                      style: AppTextStyle.header4,
                    )
                  ],
                ),
                SizedBox(
                  height: 37.h,
                ),
                MoreSettingTileWidget(
                    title: 'Profile Settings',
                    description: "Check and edit your account info",
                    onTap: () {}),
                SizedBox(
                  height: 12.h,
                ),
                Divider(
                  color: ThemeColors.moreSetingDividerColor,
                ),
                SizedBox(
                  height: 15.h,
                ),
                MoreSettingTileWidget(
                    title: 'Payout Methods',
                    description: "Check and edit your payout methods",
                    onTap: () {}),
                SizedBox(
                  height: 12.h,
                ),
                Divider(
                  color: ThemeColors.moreSetingDividerColor,
                ),
                SizedBox(
                  height: 15.h,
                ),
                MoreSettingTileWidget(
                    title: 'Payout  History',
                    description: "Check your previous transactions",
                    onTap: () {}),
                SizedBox(
                  height: 12.h,
                ),
                Divider(
                  color: ThemeColors.moreSetingDividerColor,
                ),
                SizedBox(
                  height: 15.h,
                ),
                MoreSettingTileWidget(
                    title: 'Notifications',
                    description: "Adjust your notifications preferences",
                    onTap: () {}),
              ],
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  builder: (context) {
                    return delteAccountModal();
                  },
                );
                return;
              },
              child: Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                height: 56.h,
                decoration: BoxDecoration(
                  color: ThemeColors.wishCardBgColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text("Delete My Account",
                    style: AppTextStyle.errorFontStyle),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget delteAccountModal() {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration:
          BoxDecoration(color: ThemeColors.bottomModelSheetBgtranspearentColor),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: ThemeColors.backButtonBackgroung,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24))),
            padding: EdgeInsets.all(23.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Delete Account?',
                  style: AppTextStyle.logoutLabelStyle,
                ),
                SizedBox(
                  height: 9.h,
                ),
                Text(
                  'Are you sure that you want to delete your account permenantly',
                  style: AppTextStyle.buttonText,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 150.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: ThemeColors.backButtonBorderColor),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text('Cancel',
                            style: AppTextStyle.moreSettingTitleText),
                      ),
                    ),
                    PrimaryButton(
                      onTap: () {
                        Get.offAllNamed(Routes().getSignUp());
                      },
                      text: "Confirm",
                      width: 150.w,
                      height: 50.h,
                    ),
                  ],
                ),
                SizedBox(
                  height: 41.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
