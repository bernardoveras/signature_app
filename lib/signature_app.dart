import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature_app/shared/routes.dart';

import 'shared/theme/app_color.dart';

class SignatureApp extends StatelessWidget {
  const SignatureApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Signature App',
      theme: ThemeData(
        colorSchemeSeed: AppColor.primaryColor,
        backgroundColor: const Color(0xFFE9EAEF),
        scaffoldBackgroundColor: const Color(0xFFE9EAEF),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColor.primaryColor,
          hoverColor: AppColor.primaryColorHover,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.routes,
    );
  }
}
