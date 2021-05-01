import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:weather_app/presentations/navigator/bottom_navigator.dart';
import 'package:weather_app/presentations/screens/login_screen.dart';
import 'package:weather_app/presentations/screens/welcome_screen.dart';

import 'presentations/core/constants/screen_router_constants.dart';
import 'presentations/core/themes/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return GetMaterialApp(
      title: 'Weather App',
      theme: AppTheme.lightTheme,
      initialRoute: ScreenRouterConstants.LOGIN,
      getPages: [
        GetPage(name: ScreenRouterConstants.LOGIN, page: () => LoginScreen()),
        GetPage(
            name: ScreenRouterConstants.WELCOME_SCREEN,
            page: () => WelcomeScreen()),
        GetPage(
            name: ScreenRouterConstants.BOTTOM_NAVIGATOR,
            page: () => BottomNavigator()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
