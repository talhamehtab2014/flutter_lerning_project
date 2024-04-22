import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../utils/colors.dart';
import '../utils/phone_number_formatter.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({super.key});

  @override
  Widget build(BuildContext context) {
    PhnTextFieldController phnTextFieldController =
        Get.put(PhnTextFieldController());
    return Obx(
      () {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              width: 305.w,
              height: 50.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: phnTextFieldController.showError.value
                      ? Colors.red
                      : ThemeColors.txtFieldBorderColor,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                //mainAxisSize: MainAxisSize.min,
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CountryCodePicker(
                    padding: EdgeInsets.zero,
                    flagDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: phnTextFieldController.showError.value
                          ? ThemeColors.errorFontColor
                          : null,
                    ),
                    flagWidth: 21.w,
                    textStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: phnTextFieldController.showError.value
                          ? ThemeColors.errorFontColor
                          : ThemeColors.mainTitle,
                    ),
                    initialSelection: 'EG',
                    favorite: const ['+39', 'FR'],
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                    showDropDownButton: true,
                    hideSearch: false,
                    onChanged: (CountryCode countryCode) {
                      if (countryCode.toString() == '') {
                        phnTextFieldController.countryCode = '+20';
                      } else {
                        phnTextFieldController.countryCode =
                            countryCode.toString();
                      }
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: phnTextFieldController.controller,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: phnTextFieldController.showError.value
                            ? ThemeColors.errorFontColor
                            : ThemeColors.mainTitle,
                      ),
                      showCursor: false,
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: false, signed: false),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11),
                        PhoneNumberFormatter(),
                      ],
                      onChanged: (value) {
                        if (phnTextFieldController.controller.text.length ==
                            13) {
                          phnTextFieldController.showError.value =
                              false; // Close the keyboard when the last digit is entered
                          FocusScope.of(context).unfocus();
                        }
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your phone number',
                        hintStyle: TextStyle(
                          color: phnTextFieldController.showError.value
                              ? ThemeColors.errorFontColor
                              : ThemeColors.mainTitle,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            phnTextFieldController.showError.value
                ? Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(top: 10.h),
                    child: const Text(
                      'Mobile Number is Incorrect',
                      style: TextStyle(color: ThemeColors.errorFontColor),
                    ),
                  )
                : Container(),
          ],
        );
      },
    );
  }
}

class PhnTextFieldController extends GetxController {
  final TextEditingController controller = TextEditingController();

  var countryCode = '+20';
  var phoneNumber = '';
  RxString completePhoneNum = ''.obs;
  RxBool showError = false.obs;

  savePhoneNumber() {
    phoneNumber = controller.text.replaceAll(' ', '');
    completePhoneNum.value =
        countryCode + phoneNumber; // Concatenate country code and phone number

    //_controller.text = ''; // Clear the text field
  }

  checkinfo() {
    print(countryCode);
    print(completePhoneNum.value);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
