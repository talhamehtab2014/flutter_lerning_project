import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iwish_practice/utils/app_assets.dart';
import 'package:flutter_iwish_practice/utils/app_text_style.dart';
import 'package:flutter_iwish_practice/utils/colors.dart';
import 'package:flutter_iwish_practice/utils/routes.dart';
import 'package:flutter_iwish_practice/widgets/more_setting_tile_widget.dart';
import 'package:flutter_iwish_practice/widgets/primaryButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MorePage extends StatelessWidget {
  static const id = "/MorePage";
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            SizedBox(
              height: 55.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 41.w,
                      height: 41.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                        child: Image.asset(
                          AppAssets.profileAvatar,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 23.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hello Khalid,',
                          style: AppTextStyle.completionMessageStyle,
                        ),
                        Text(
                          'Good Morning',
                          style: AppTextStyle.appBarMessageStyle,
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (context) {
                        return logOutModal();
                      },
                    );
                    return;
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: 8.h, top: 6.h, left: 6),
                    width: 36.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ThemeColors.errorFontColor,
                          Color(0xFFDE4BA3),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                    ),
                    child: Icon(Icons.logout, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            MoreSettingTileWidget(
              title: 'Settings',
              description: 'Check and manage your account details',
              onTap: () {
                Get.toNamed(Routes().getSettingPage());
              },
            ),
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
              title: 'Invite Friends',
              description: 'Earn and share cash with your friends',
              onTap: () {},
            ),
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
              title: 'Transactions',
              description: 'Check your financial dashboard',
              onTap: () {
                Get.toNamed(Routes().getTransactionsPage());
              },
            ),
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
              title: 'Help & Support',
              description: 'Help center and legal terms',
              onTap: () {},
            ),
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
              title: 'Submit a Request',
              description: 'Get in touch with our team for help',
              onTap: () {},
            ),
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
              title: 'Rate Our App',
              description: "We'd like to hear from you",
              onTap: () {},
            ),
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
              title: 'Privacy Policy',
              description: "Our privacy and policies",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

Widget logOutModal() {
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
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          padding: EdgeInsets.all(23.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Logout?',
                style: AppTextStyle.logoutLabelStyle,
              ),
              SizedBox(
                height: 9.h,
              ),
              Text(
                'Are you sure that you want to logout from your account',
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
                      Get.offAllNamed(Routes().getLoginPage());
                    },
                    text: "Yes, Please",
                    width: 150.w,
                    height: 50.h,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}
