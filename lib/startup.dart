import 'package:get/get.dart';
import 'package:local_grocery/support/config/app_strings.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:local_grocery/ui/main_page.dart';

class Startup extends StatelessWidget {
  const Startup({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // translations: AppString(),
      // locale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,

      title: 'appName',

      /// Initial Routing
      initialRoute: '/',
      getPages: [GetPage(name: '/', page: () => MainPage())],

      /// Theme
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,

      //Routing
      // onGenerateRoute: Application.router!.generator,
    );
  }
}
