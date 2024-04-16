import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_code_picker/country_code_picker.dart';

import '../utils/colors.dart';
import '../utils/phone_number_formatter.dart';

class PhoneTextField extends StatefulWidget {
  const PhoneTextField({super.key});

  @override
  _PhoneTextFieldState createState() {
    return _PhoneTextFieldState();
  }
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  final TextEditingController _controller = TextEditingController();
  bool _showError = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          width: 305.w,
          height: 50.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: _showError ? Colors.red : ThemeColors.txtFieldBorderColor,
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
                  color: _showError ? ThemeColors.errorFontColor : null,
                ),
                flagWidth: 21.w,
                textStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: _showError
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
              ),
              Expanded(
                child: TextField(
                  controller: _controller,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: _showError
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
                  onEditingComplete: () {
                    if (_controller.text.length == 11) {
                      // Close the keyboard when the last digit is entered
                      FocusScope.of(context).unfocus();
                    }
                    setState(() {
                      _showError = _controller.text.length < 11;
                    });
                  },
                  /*onChanged: (value) {
                    setState(() {
                      _showError = value.length < 11;
                    });
                  },*/
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your phone number',
                    hintStyle: TextStyle(
                      color: ThemeColors.mainTitle,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        _showError
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
  }
}
