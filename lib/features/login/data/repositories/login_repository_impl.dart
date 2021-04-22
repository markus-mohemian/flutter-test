import 'package:dartz/dartz.dart';
import '../datasources/login_user.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/login_model.dart';
import '../../domain/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginUser loginUser;

  LoginRepositoryImpl(this.loginUser);

  @override
  Future<Either<Failure, bool>> login(LoginModel login) async {
    try {
      final user = await loginUser.login(login);
      return Right(user != null);
    } catch (exception) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
