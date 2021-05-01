import 'package:weather_app/domain/authentication/user.dart';
import 'package:weather_app/domain/core/constants/app_constants.dart';

class AnonymousUser extends User{
  AnonymousUser() : super(AppConstants.ANONYMOUS_TEXT);
}