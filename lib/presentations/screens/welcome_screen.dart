import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textless/textless.dart';
import 'package:weather_app/applications/services/auth_service.dart';
import 'package:weather_app/domain/authentication/anonymous_user.dart';
import 'package:weather_app/presentations/core/constants/screen_router_constants.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Get.find<AuthService>();
    final user = authService.user;
    print(user);
    return Scaffold(
      appBar: user is AnonymousUser
          ? AppBar(
              actions: [
                IconButton(
                    icon: const Icon(
                      Icons.settings,
                    ),
                    onPressed: () {
                      // TODO add setting dialog then move the logout call to there
                      authService.logOut();
                      Get.offAndToNamed(ScreenRouterConstants.LOGIN);
                    })
              ],
            )
          : null,
      body: Center(child: 'Welcome Screen'.h6),
    );
  }
}
