import 'package:flutter_iwish_practice/modules/bottom_navigation/screens/bottom_navigation.dart';
import 'package:flutter_iwish_practice/modules/create_wish/screens/create_wish.dart';
import 'package:flutter_iwish_practice/modules/create_wish/screens/wish_creation_success.dart';
import 'package:flutter_iwish_practice/modules/create_wish/screens/wish_summary.dart';
import 'package:flutter_iwish_practice/modules/interest/screens/user_interest.dart';
import 'package:flutter_iwish_practice/modules/login/screens/login.dart';
import 'package:flutter_iwish_practice/modules/otp/screens/otp.dart';
import 'package:flutter_iwish_practice/modules/sign_up/screens/sign_up.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class Routes {
  static final Routes _sharedInstance = Routes.internal();
  factory Routes() {
    return _sharedInstance;
  }
  Routes.internal();
  String getSignUp() => SignUp.id;
  String getOtpPage() => OtpPage.id;
  String getLoginPage() => Login.id;
  String getUserInterestPage() => UserInterest.id;
  String getCreateWishPage() => CreateWish.id;
  String getWishSummaryPage() => WishSummary.id;
  String getWishCreationSuccess() => WishCreationSuccess.id;
  String getBottomnavingation() => BottomNavigation.id;
  List<GetPage> routesMap = [
    GetPage(
        name: SignUp.id,
        page: () => const SignUp(),
        transition: Transition.fadeIn),
    GetPage(
        name: OtpPage.id, page: () => OtpPage(), transition: Transition.fadeIn),
    GetPage(
        name: Login.id,
        page: () => const Login(),
        transition: Transition.fadeIn),
    GetPage(
        name: CreateWish.id,
        page: () => CreateWish(),
        transition: Transition.fadeIn),
    GetPage(
        name: UserInterest.id,
        page: () => UserInterest(),
        transition: Transition.fadeIn),
    GetPage(
        name: WishCreationSuccess.id,
        page: () => WishCreationSuccess(),
        transition: Transition.fadeIn),
    GetPage(
        name: WishSummary.id,
        page: () => WishSummary(),
        transition: Transition.fadeIn),
    GetPage(
        name: BottomNavigation.id,
        page: () => BottomNavigation(),
        transition: Transition.fadeIn)
  ];
}
