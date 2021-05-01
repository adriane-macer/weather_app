import 'package:weather_app/domain/core/constants/text_field_constatnts.dart';

abstract class TextFieldFailure {
  final String message;

  TextFieldFailure(this.message);
}

class InvalidEmailFailure extends TextFieldFailure {
  InvalidEmailFailure({String message = "Invalid email"}) : super(message);
}

class PasswordToShortFailure extends TextFieldFailure {
  PasswordToShortFailure(
      {String message =
          "Password too short.(minimum length: ${TextFieldConstants.MIN_PASSWORD_LENGTH}"})
      : super(message);
}

class PasswordEmptyFailure extends TextFieldFailure {
  PasswordEmptyFailure({String message = "Empty password"}) : super(message);
}
