import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iwish_practice/utils/app_assets.dart';
import 'package:flutter_iwish_practice/utils/routes.dart';
import 'package:flutter_iwish_practice/widgets/primaryButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/app_text_style.dart';
import '../../../utils/colors.dart';
import '../../../widgets/back_button.dart';
import '../controller/create_wish_controller.dart';

class WishSummary extends StatelessWidget {
  static const id = "/wishSummary";
  const WishSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateWishController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    'Wish Summary',
                    style: AppTextStyle.header4,
                  )
                ],
              ),
              SizedBox(
                height: 26.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (controller.imagepath.isNotEmpty)
                    Expanded(
                      child: Container(
                        width: controller.imagepath.length > 1
                            ? 214.w
                            : 347
                                .w, // Adjust width based on the number of images
                        height: 224
                            .h, // Adjust height based on the number of images
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              10.r,
                            ),
                          ),
                          child: Image.file(
                            fit: BoxFit.cover,
                            File(controller.imagepath[0]),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                    width: 12.h,
                  ),
                  // Conditionally render the second image container
                  if (controller.imagepath.length >= 2)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 101.w,
                          height: 101.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                10.r,
                              ),
                            ),
                            child: Image.file(
                              fit: BoxFit.cover,
                              File(controller.imagepath[1]),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        controller.imagepath.length == 3
                            ? Container(
                                width: 101.w,
                                height: 101.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      10.r,
                                    ),
                                  ),
                                  child: Image.file(
                                    fit: BoxFit.cover,
                                    File(controller.imagepath[2]),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                ],
              ),
              SizedBox(
                height: 26.h,
              ),
              Text(
                'Product Details',
                style: AppTextStyle.textFieldTitle,
              ),
              SizedBox(
                height: 11.h,
              ),
              Container(
                padding: EdgeInsets.only(top: 15.h, left: 15.w),
                width: 327.w,
                height: 68.h,
                decoration: BoxDecoration(
                  color: ThemeColors.socialSignInButton,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Name',
                      style: AppTextStyle.wishSummaryDetaillabel,
                    ),
                    Text(
                      controller.productNameController.text,
                      style: AppTextStyle.cardMainTitle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 15.h, left: 15.w),
                    width: 157.w,
                    height: 68.h,
                    decoration: BoxDecoration(
                      color: ThemeColors.socialSignInButton,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quantity',
                          style: AppTextStyle.wishSummaryDetaillabel,
                        ),
                        Text(
                          ' ${controller.quantity.value} Pieces',
                          style: AppTextStyle.cardMainTitle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15.h, left: 15.w),
                    width: 157.w,
                    height: 68.h,
                    decoration: BoxDecoration(
                      color: ThemeColors.socialSignInButton,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Product Url',
                              style: AppTextStyle.wishSummaryDetaillabel,
                            ),
                            const SizedBox(
                              height: 2.5,
                            ),
                            Text(
                              overflow: TextOverflow.clip,
                              controller.productUrlController.text,
                              style: AppTextStyle.cardMainTitle,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 6.h, right: 26.w),
                            child: Image.asset(
                              AppAssets.icProductUrl,
                              width: 15.w,
                              height: 15.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                padding: EdgeInsets.only(top: 15.h, left: 15.w),
                width: 327.w,
                height: 132.h,
                decoration: BoxDecoration(
                  color: ThemeColors.socialSignInButton,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Description',
                      style: AppTextStyle.wishSummaryDetaillabel,
                    ),
                    Text(
                      controller.productDescriptionController.text,
                      style: AppTextStyle.cardMainTitle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Container(
                padding: EdgeInsets.only(top: 15.h, left: 15.w),
                width: 327.w,
                height: 68.h,
                decoration: BoxDecoration(
                  color: ThemeColors.socialSignInButton,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Desired Country of Purchase',
                      style: AppTextStyle.wishSummaryDetaillabel,
                    ),
                    Text(
                      controller.purchaseCountry.value,
                      style: AppTextStyle.cardMainTitle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              PrimaryButton(
                onTap: () {
                  Get.toNamed(Routes().getWishCreationSuccess());
                },
                text: 'Create Wish',
                width: 327.w,
              ),
              SizedBox(
                height: 27.h,
              ),
              Text(
                "By publishing my wish, I agree to iWish's Terms of Use & I understand that if the product details are incorrect, my order may be canceled.",
                style: AppTextStyle.termConditionTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
