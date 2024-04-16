import 'package:flutter/material.dart';
import 'package:flutter_iwish_practice/utils/app_assets.dart';
import 'package:flutter_iwish_practice/utils/app_text_style.dart';
import 'package:flutter_iwish_practice/widgets/custom_app_bar.dart';
import 'package:flutter_iwish_practice/widgets/topShoppers_listView.dart';
import 'package:flutter_iwish_practice/widgets/trending_wishes_grid.dart';
import 'package:flutter_iwish_practice/widgets/trip_card.dart';
import 'package:flutter_iwish_practice/widgets/wish_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 23.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: Row(
                children: [
                  WishCard(),
                  SizedBox(
                    width: 17.w,
                  ),
                  TripCard(),
                ],
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            TopShoppersListView(),
            SizedBox(
              height: 34.h,
            ),
            TrendingWishesGrid(),
          ],
        ),
      ),
    );
  }
}
