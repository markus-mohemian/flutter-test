import 'package:equatable/equatable.dart';

import '../dto/login_dto.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class CheckLoginEvent extends LoginEvent {
  final LoginDTO login;

  CheckLoginEvent({required this.login});

  @override
  List<Object> get props => [login];
}
