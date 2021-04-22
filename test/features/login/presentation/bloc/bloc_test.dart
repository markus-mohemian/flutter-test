import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/core/error/failures.dart';
import 'package:myapp/features/login/domain/entities/login_model.dart';
import 'package:myapp/features/login/domain/usecases/login_with_credentials.dart';
import 'package:myapp/features/login/presentation/bloc/bloc.dart';
import 'package:myapp/features/login/presentation/bloc/login_bloc.dart';
import 'package:myapp/features/login/presentation/dto/login_dto.dart';

import 'bloc_test.mocks.dart';

@GenerateMocks([LoginWithCredentials])
void main() {
  late MockLoginWithCredentials mockLogin;
  late LoginBloc bloc;

  setUp(() {
    mockLogin = MockLoginWithCredentials();
    bloc = LoginBloc(loginUseCase: mockLogin);
  });

  test(
    'initial state should be InitialLoginState',
    () async {
      // assert
      expect(bloc.state, equals(InitialLoginState()));
    },
  );

  group('Login', () {
    final tLoginDTO = LoginDTO(username: 'username', password: "password");

    test('should call login', () async {
      //given
      when(mockLogin(any)).thenAnswer((_) async => Right(true));
      //when
      bloc.add(CheckLoginEvent(login: tLoginDTO));
      await untilCalled(mockLogin(any));
      //then
      verify(mockLogin(Params(
          login: LoginModel(
        username: tLoginDTO.username,
        password: tLoginDTO.password,
      ))));
    });

    test(
      'should emit [Checking, Logged] when data are correct',
      () async {
        // given
        when(mockLogin(any)).thenAnswer((_) async => Right(true));
        // when
        bloc.add(CheckLoginEvent(login: tLoginDTO));
        // assert
        expectLater(
            bloc.stream,
            emitsInOrder([
              CheckingLoginState(),
              LoggedState(),
            ]));
      },
    );

    test(
      'should emit [Checking, Error] when data are not correct',
      () async {
        // given
        when(mockLogin(any)).thenAnswer((_) async => Right(false));
        // when
        bloc.add(CheckLoginEvent(login: tLoginDTO));
        // assert
        expectLater(
            bloc.stream,
            emitsInOrder([
              CheckingLoginState(),
              ErrorLoggedState(),
            ]));
      },
    );

    test(
      'should emit [Checking, Error] when server error',
      () async {
        // given
        when(mockLogin(any)).thenAnswer((_) async => Left(ServerFailure()));
        // when
        bloc.add(CheckLoginEvent(login: tLoginDTO));
        // assert
        expectLater(
            bloc.stream,
            emitsInOrder([
              CheckingLoginState(),
              ErrorLoggedState(),
            ]));
      },
    );
  });
}
