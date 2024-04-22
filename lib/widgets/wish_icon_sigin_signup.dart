import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_assets.dart';

class WishIconSignInSignUp extends StatelessWidget {
  const WishIconSignInSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 170.h,
        ),
        Image.asset(AppAssets.icWishHome),
        SizedBox(
          height: 47.h,
        ),
      ],
    );
  }
}
