import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../domain/entities/login_model.dart';
import '../../domain/usecases/login_with_credentials.dart';

import 'bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginWithCredentials loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(InitialLoginState());

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is CheckLoginEvent) {
      yield CheckingLoginState();
      final result = await loginUseCase(
        Params(
          login: LoginModel(
            username: event.login.username,
            password: event.login.password,
          ),
        ),
      );
      yield result.fold(
        (failure) => ErrorLoggedState(),
        (value) => (value) ? LoggedState() : ErrorLoggedState(),
      );
    }
  }
}
