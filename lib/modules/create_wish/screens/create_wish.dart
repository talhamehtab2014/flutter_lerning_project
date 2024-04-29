import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iwish_practice/modules/create_wish/controller/create_wish_controller.dart';
import 'package:flutter_iwish_practice/utils/app_assets.dart';
import 'package:flutter_iwish_practice/utils/app_text_style.dart';
import 'package:flutter_iwish_practice/utils/routes.dart';
import 'package:flutter_iwish_practice/widgets/image_upoad_widget.dart';
import 'package:flutter_iwish_practice/widgets/input_field.dart';
import 'package:flutter_iwish_practice/widgets/primaryButton.dart';
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
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
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
                    'Product Details',
                    style: AppTextStyle.header4,
                  )
                ],
              ),
              SizedBox(
                height: 27.h,
              ),
              Obx(
                () {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      controller.imagePath1.isNotEmpty
                          ? Container(
                              width: 100.w,
                              height: 100.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    8.r,
                                  ),
                                ),
                                child: Image.file(
                                  fit: BoxFit.cover,
                                  File(
                                    controller.imagePath1.toString(),
                                  ),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                controller.getImage(controller.imagePath1);
                              },
                              child: ImaggeUploadWidget(),
                            ),
                      controller.imagePath2.isNotEmpty
                          ? Container(
                              width: 100.w,
                              height: 100.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    8.r,
                                  ),
                                ),
                                child: Image.file(
                                  fit: BoxFit.cover,
                                  File(
                                    controller.imagePath2.toString(),
                                  ),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                controller.getImage(controller.imagePath2);
                              },
                              child: ImaggeUploadWidget(),
                            ),
                      controller.imagePath3.isNotEmpty
                          ? Container(
                              width: 100.w,
                              height: 100.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    8.r,
                                  ),
                                ),
                                child: Image.file(
                                  fit: BoxFit.cover,
                                  File(
                                    controller.imagePath3.toString(),
                                  ),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                controller.getImage(controller.imagePath3);
                              },
                              child: ImaggeUploadWidget(),
                            ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              InputField(
                controller: controller.productNameController,
                hintText: 'Product Name',
              ),
              Text(
                'Desired Country of Purchase',
                style: AppTextStyle.textFieldTitle,
              ),
              SizedBox(
                height: 7.h,
              ),
              Container(
                width: 327.w,
                height: 45.h,
                decoration: BoxDecoration(
                  border: Border.all(color: ThemeColors.txtFieldBorderColor),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Obx(
                  () {
                    return DropdownButton(
                      hint: const Text('Select Your Desired Purchase Country'),
                      borderRadius: BorderRadius.circular(8.r),
                      icon: Image.asset(
                        AppAssets.icDropDown,
                      ),
                      elevation: 1,
                      underline: Container(),
                      value: controller.purchaseCountry.value,
                      isExpanded: true,
                      padding: EdgeInsets.only(left: 17.w, right: 20.w),
                      style: AppTextStyle.textFieldLabel,
                      items: const [
                        DropdownMenuItem<String>(
                          value: '',
                          child: Text(''),
                        ),
                        DropdownMenuItem<String>(
                          value: 'USA',
                          child: Text('United States of America'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Qatar',
                          child: Text('Qatar'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Canada',
                          child: Text('Canada'),
                        ),
                      ],
                      onChanged: (String? value) {
                        controller.purchaseCountry.value = value!;
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 14.5.h,
              ),
              InputField(
                  controller: controller.productUrlController,
                  hintText: 'Product URL'),
              Text(
                'Select Category',
                style: AppTextStyle.textFieldTitle,
              ),
              SizedBox(
                height: 7.5.h,
              ),
              Container(
                width: 327.w,
                height: 45.h,
                decoration: BoxDecoration(
                  border: Border.all(color: ThemeColors.txtFieldBorderColor),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Obx(
                  () {
                    return DropdownButton(
                      // disabledHint: Text('Select Category'),
                      hint: const Text('Select Category'),
                      borderRadius: BorderRadius.circular(8.r),
                      icon: Image.asset(
                        AppAssets.icDropDown,
                      ),
                      elevation: 1,
                      underline: Container(),
                      value: controller.category.value,
                      isExpanded: true,
                      padding: EdgeInsets.only(left: 17.w, right: 20.w),
                      style: AppTextStyle.textFieldLabel,
                      items: const [
                        DropdownMenuItem<String>(
                          value: '',
                          child: Text(''),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Electronics',
                          child: Text('Electronics'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Fashion',
                          child: Text('Fashion'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Beauty',
                          child: Text('Beauty'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Health',
                          child: Text('Health'),
                        ),
                      ],
                      onChanged: (String? value) {
                        controller.category.value = value!;
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Text(
                'Quantity',
                style: AppTextStyle.textFieldTitle,
              ),
              SizedBox(
                height: 7.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.w, right: 11.w),
                width: 327.w,
                height: 45.h,
                decoration: BoxDecoration(
                  border: Border.all(color: ThemeColors.txtFieldBorderColor),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Obx(
                  () {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.setQuantity(false);
                          },
                          child: Text(
                            '-',
                            style: AppTextStyle.quantityStyle,
                          ),
                        ),
                        Text(
                          controller.quantity.value.toString(),
                          style: AppTextStyle.quantityCountStyle,
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.setQuantity(true);
                          },
                          child: Text(
                            '+',
                            style: AppTextStyle.quantityStyle,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              InputField(
                controller: controller.productDescriptionController,
                hintText: 'Product Description',
                maxLines: 4,
                height: 108.h,
              ),
              SizedBox(
                height: 33.h,
              ),
              PrimaryButton(
                onTap: () {
                  Get.toNamed(Routes().getWishSummaryPage());
                },
                text: 'Proceed',
                width: 327.w,
                height: 50.h,
              ),
              SizedBox(
                height: 86.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
