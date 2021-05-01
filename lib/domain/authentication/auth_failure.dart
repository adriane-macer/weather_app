abstract class AuthFailure {
  final String message;

  AuthFailure(this.message);
}

class EmailAndPasswordNotMatched extends AuthFailure {
  EmailAndPasswordNotMatched(
      {String message = "Email and password din not matched"})
      : super(message);
}


