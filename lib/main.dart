import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:weather_app/domain/authentication/anonymous_user.dart';
import 'package:weather_app/presentations/navigator/bottom_navigator.dart';
import 'package:weather_app/presentations/screens/home_screen.dart';
import 'package:weather_app/presentations/screens/login_screen.dart';
import 'package:weather_app/presentations/screens/welcome_screen.dart';

import 'applications/services/auth_service.dart';
import 'presentations/core/constants/screen_router_constants.dart';
import 'presentations/core/themes/app_theme.dart';

Future<void> main() async {
  await _initServices();
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
        GetPage(
            name: ScreenRouterConstants.LOGIN,
            page: () {
              final authService = Get.find<AuthService>();
              final user = authService.getUser();
              if (user == null) {
                return LoginScreen();
              }

              if (user is AnonymousUser) {
                return WelcomeScreen();
              }
              return BottomNavigator();
            }),
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

Future<void> _initServices() async {
  Get.put(AuthService());
  final authService = Get.find<AuthService>();
  await authService.init();
}
