import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textless/textless.dart';
import 'package:weather_app/applications/services/auth_service.dart';
import 'package:weather_app/presentations/core/constants/screen_router_constants.dart';
import 'package:weather_app/presentations/widgets/widget_gap.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            "Weather App".h3,
            const WidgetGap(),
            const TextField(),
            const WidgetGap(),
            const TextField(),
            const WidgetGap(),
            ElevatedButton(
                onPressed: () {
                  // TODO implement login with github
                }, child: "Login".b2),
            const WidgetGap(),
            InkWell(
                onTap: () => _loginAsAnonymous(),
                child: "Login as anonymous".b2.italic)
          ],
        ),
      )),
    );
  }

  Future _loginAsAnonymous() async {
    final authService = Get.find<AuthService>();
    await authService.loginAsAnonymous();
    Get.offAndToNamed(ScreenRouterConstants.WELCOME_SCREEN);
  }
}
