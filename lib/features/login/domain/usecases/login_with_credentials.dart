import 'package:dartz/dartz.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/login_model.dart';
import '../../../../core/error/failures.dart';
import '../repositories/login_repository.dart';

class LoginWithCredentials implements UseCase<bool, LoginModel> {
  final LoginRepository loginRepository;

  LoginWithCredentials(this.loginRepository);

  @override
  Future<Either<Failure, bool>> call(LoginModel login) async {
    return await loginRepository.login(login);
  }
}
