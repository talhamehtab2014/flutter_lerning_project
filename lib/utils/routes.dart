import 'package:flutter_iwish_practice/modules/sign_up/screens/otp.dart';
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
  List<GetPage> routesMap = [
    GetPage(
        name: SignUp.id, page: () => SignUp(), transition: Transition.fadeIn),
    GetPage(
        name: OtpPage.id, page: () => OtpPage(), transition: Transition.fadeIn)
  ];
}
