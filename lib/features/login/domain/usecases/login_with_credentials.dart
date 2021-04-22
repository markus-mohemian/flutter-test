import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/login_model.dart';
import '../repositories/login_repository.dart';

class LoginWithCredentials extends UseCase<bool, Params> {
  final LoginRepository loginRepository;

  LoginWithCredentials(this.loginRepository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await loginRepository.login(params.login);
  }
}

class Params extends Equatable {
  final LoginModel login;

  Params({
    required this.login,
  });

  @override
  List<Object> get props => [login];
}
