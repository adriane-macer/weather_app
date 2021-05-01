import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:weather_app/applications/services/auth_service.dart';
import 'package:weather_app/domain/authentication/anonymous_user.dart';
import 'package:weather_app/domain/authentication/auth_failure.dart';
import 'package:weather_app/domain/authentication/i_auth_facade.dart';
import 'package:weather_app/domain/authentication/user.dart';
import 'package:weather_app/domain/core/constants/app_constants.dart';

class AuthFacade extends IAuthFacade {
  @override
  Future<User> loginAsAnonymous() async {
    final authService = Get.find<AuthService>();
    await authService.saveUsername(AppConstants.ANONYMOUS_TEXT);
    return AnonymousUser();
  }

  @override
  Future<Either<AuthFailure, User>> loginWithGithub(
      {String email, String password}) async {
    // TODO: implement loginWithGithub
    throw UnimplementedError();
  }

  @override
  Future logout() async {
    final authService = Get.find<AuthService>();
    await authService.clearUserInfo();
  }
}
