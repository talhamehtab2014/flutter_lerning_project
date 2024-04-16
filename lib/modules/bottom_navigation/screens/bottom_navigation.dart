import 'package:flutter/material.dart';
import 'package:flutter_iwish_practice/modules/home_page/screens/home_page.dart';
import 'package:flutter_iwish_practice/utils/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/colors.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  var currentPageIndex = 0;
  final screens = [
    const HomePage(),
    const Center(
      child: Text(
        'Trip',
      ),
    ),
    const Center(
      child: Text(
        'Wish',
      ),
    ),
    const Center(
      child: Text(
        'Chat',
      ),
    ),
    const Center(
      child: Text(
        'Profile',
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentPageIndex],
      backgroundColor: ThemeColors.backButtonBackgroung,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          shadowColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          labelTextStyle: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.selected)) {
                return AppTextStyle.bottomNavSelectedLabelStyle;
              }
              return AppTextStyle.bottomNavUnselectedLabelStyle;
            },
          ),
        ),
        child: NavigationBar(
          animationDuration: Duration.zero,
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          elevation: 0,
          backgroundColor: ThemeColors.backButtonBackgroung,
          height: 95,
          destinations: [
            _buildNavigationDestination(
                imagePath: AppAssets.icNavHome, label: 'Home'),
            _buildNavigationDestination(
                imagePath: AppAssets.icNavTrip, label: 'Trip'),
            _buildNavigationDestination(
                imagePath: AppAssets.icNavWish, label: 'Wish'),
            _buildNavigationDestination(
                imagePath: AppAssets.icNavChat, label: 'Chat'),
            _buildNavigationDestination(
                imagePath: AppAssets.icNavProfile, label: 'More')
          ],
        ),
      ),
    );
  }
}

NavigationDestination _buildNavigationDestination({
  required String imagePath,
  required String label,
}) {
  return NavigationDestination(
    icon: Image(
      image: AssetImage(imagePath),
      width: 20.w,
      height: 20.h,
    ),
    label: label,
    selectedIcon: Container(
      width: 38.w,
      height: 38.h,
      decoration: BoxDecoration(
        color: ThemeColors.bottomNavSelectedBgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
      child: ColorFiltered(
        colorFilter: const ColorFilter.mode(
          ThemeColors.mainTitle, // Change the color based on selection
          BlendMode.srcIn,
        ),
        child: Image(
          image: AssetImage(
            imagePath,
          ),
          width: 20.w,
          height: 20.h,
        ),
      ),
    ),
  );
}
