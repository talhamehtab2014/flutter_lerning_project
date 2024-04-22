import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iwish_practice/modules/create_wish/controller/create_wish_controller.dart';
import 'package:flutter_iwish_practice/utils/app_assets.dart';
import 'package:flutter_iwish_practice/utils/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_iwish_practice/widgets/back_button.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';

class CreateWish extends StatelessWidget {
  static const id = "/createWish";
  const CreateWish({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateWishController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.w),
        child: Column(
          children: [
            SizedBox(
              height: 49.h,
            ),
            Row(
              children: [
                const CustomBackButton(),
                SizedBox(
                  width: 71.w,
                ),
                Text(
                  'Product Details',
                  style: AppTextStyle.header4,
                )
              ],
            ),
            SizedBox(
              height: 27.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.getImages();
                  },
                  child: DottedBorder(
                      borderType: BorderType.RRect,
                      dashPattern: const [5, 5],
                      strokeCap: StrokeCap.round,
                      radius: Radius.circular(8.r),
                      color: ThemeColors.backButtonBorderColor,
                      child: SizedBox(
                        width: 100.w,
                        height: 100.h,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 18.h,
                            ),
                            Image.asset(
                              AppAssets.icFileUpload,
                              width: 23.w,
                              height: 23.h,
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              'Upload',
                              style: AppTextStyle.bottomNavSelectedLabelStyle,
                            ),
                            Text(
                              "jpg or png",
                              style: AppTextStyle.normalText,
                            )
                          ],
                        ),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
