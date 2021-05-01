import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/domain/authentication/anonymous_user.dart';
import 'package:weather_app/domain/authentication/github_user.dart';
import 'package:weather_app/domain/authentication/user.dart';
import 'package:weather_app/domain/core/constants/app_constants.dart';

class AuthService extends GetxService {
  User getUser() {
    final box = GetStorage();
    final String userName = box.read(AppConstants.USER_NAME_KEY);

    if (userName == null) {
      return null;
    }

    if (userName == "Anonymous") {
      return AnonymousUser();
    } else {
      final String url = box.read(AppConstants.URL_KEY);

      return GithubUser(userName, url);
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
}
