import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class ContinueWith extends StatelessWidget {
  const ContinueWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            indent: 25.w,
            color: ThemeColors.dividerOrSIgnInWith.withOpacity(0.3),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Text(
          'Or continue with',
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          width: 16.w,
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            endIndent: 25.w,
            color: ThemeColors.dividerOrSIgnInWith.withOpacity(0.3),
          ),
        ),
      ],
    );
  }
}
