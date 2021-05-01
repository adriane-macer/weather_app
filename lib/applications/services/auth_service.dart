import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/domain/authentication/anonymous_user.dart';
import 'package:weather_app/domain/authentication/auth_failure.dart';
import 'package:weather_app/domain/authentication/github_user.dart';
import 'package:weather_app/domain/authentication/i_auth_facade.dart';
import 'package:weather_app/domain/authentication/user.dart';
import 'package:weather_app/domain/core/constants/app_constants.dart';
import 'package:weather_app/infrastructure/auth/auth_facade.dart';

class AuthService extends GetxService {
  User user;

  User getUser() {
    final box = GetStorage();
    final String userName = box.read(AppConstants.USER_NAME_KEY);

    if (userName == null) {
      user = null;
      return null;
    }

    if (userName == AppConstants.ANONYMOUS_TEXT) {
      return user = AnonymousUser();
    } else {
      final String url = box.read(AppConstants.URL_KEY);

      return user = GithubUser(userName, url);
    }
  }

  Future init() async {
    await GetStorage.init();
  }

  Future saveUsername(String name) async {
    final box = GetStorage();
    return box.write(AppConstants.USER_NAME_KEY, name);
  }

  Future saveUrl(String url) async {
    final box = GetStorage();
    box.write(AppConstants.URL_KEY, url);
  }

  Future clearUserInfo() async {
    final box = GetStorage();
    box.remove(AppConstants.URL_KEY);
    box.remove(AppConstants.USER_NAME_KEY);
  }

  Future<Either<AuthFailure, User>> loginWithGithub(
      String email, String password) async {
    final IAuthFacade authFacade = AuthFacade();
    final result =
        await authFacade.loginWithGithub(email: email, password: password);
    if (result.isRight()) {
      result.foldRight(user, (r, previous) => null);
    }
    return result;
  }

  Future<User> loginAsAnonymous() async {
    final IAuthFacade authFacade = AuthFacade();
    return user = await authFacade.loginAsAnonymous();
  }

  Future logOut() async {
    final IAuthFacade authFacade = AuthFacade();
    authFacade.logout();
    user = null;
  }
}
