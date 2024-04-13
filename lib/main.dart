import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iwish_practice/modules/sign_up/screens/sign_up.dart';
import 'package:flutter_iwish_practice/utils/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,

      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          locale: Locale('en'),
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          //home: const SignUp(),
          initialRoute: Routes().getSignUp(),
          getPages: Routes().routesMap,
          localizationsDelegates: const [
            CountryLocalizations.delegate,
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: [
            Locale('en'),
            Locale('ar'),
          ],
        );
      },
      child: SignUp(),
    );
  }
}
