import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_assets.dart';

class HomeTopCard extends StatelessWidget {
  const HomeTopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.icBgSiginSignUp,
      width: 375.w,
      height: 345.h,
      fit: BoxFit.cover,
    );
  }
}
