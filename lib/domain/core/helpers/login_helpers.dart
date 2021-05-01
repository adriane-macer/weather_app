import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:weather_app/domain/core/constants/text_field_constatnts.dart';
import 'package:weather_app/domain/core/failures/text_field_failure.dart';

class LoginHelpers {
  LoginHelpers._();

  static Either<TextFieldFailure, bool> isValidEmail(String email) {
    if (GetUtils.isEmail(email)) {
      return right(true);
    } else {
      return left(InvalidEmailFailure());
    }
  }

  static Either<TextFieldFailure, bool> isPasswordAllowed(String password) {
    if (password.isNotEmpty &&
        password.length < TextFieldConstants.MIN_PASSWORD_LENGTH) {
      return left(PasswordToShortFailure());
    }else if(password.isEmpty){
      return left(PasswordEmptyFailure());
    }
    else{
      return right(true);
    }
  }
}