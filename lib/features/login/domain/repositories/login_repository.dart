import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/login_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, bool>> login(LoginModel login);
  Future<Either<Failure, bool>> logout();
}
