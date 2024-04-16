import 'package:flutter/material.dart';
import 'package:flutter_iwish_practice/utils/app_assets.dart';
import 'package:flutter_iwish_practice/utils/app_text_style.dart';
import 'package:flutter_iwish_practice/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInterest extends StatefulWidget {
  static const id = "/userInterest";
  @override
  _UserInterestState createState() => _UserInterestState();
}

class _UserInterestState extends State<UserInterest> {
  List<String> categories = [
    'Bags',
    'Shoes',
    'Watches',
    'Food',
    'Video Games',
    'Books',
    'Games',
    'Home Accessories'
  ];

  Set<String> selectedCategories = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              children: List<Widget>.generate(
                categories.length,
                (int index) {
                  return FilterChip(
                    showCheckmark: false,
                    selectedColor: ThemeColors.toggleSwitchBgColor,
                    labelStyle: AppTextStyle.buttonText,
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
                    label: Text(categories[index]),
                    selected: selectedCategories.contains(categories[index]),
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          selectedCategories.add(categories[index]);
                        } else {
                          selectedCategories.remove(categories[index]);
                        }
                      });
                    },
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
