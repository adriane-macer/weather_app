import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/domain/authentication/user.dart';

import 'auth_failure.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, User>> loginWithGithub(
      {@required String email, @required String password});

  Future<User> loginAsAnonymous();

  Future logout();
}
