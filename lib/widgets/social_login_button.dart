import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/colors.dart';

class SocialLoginButton extends StatelessWidget {
  final String icon;
  const SocialLoginButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 87.w,
        height: 51.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
          color: ThemeColors.socialSignInButton,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(icon),
          ),
        ),
      ),
    );
  }
}
