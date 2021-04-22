import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/features/login/data/datasources/login_user.dart';
import 'package:myapp/features/login/data/models/user.dart';
import 'package:myapp/features/login/data/repositories/login_repository_impl.dart';
import 'package:myapp/features/login/domain/entities/login_model.dart';

import 'login_repository_impl_test.mocks.dart';

@GenerateMocks([LoginUser])
void main() {
  late MockLoginUser mockLoginUser;
  late LoginRepositoryImpl loginRepositoryImpl;

  setUp(() {
    mockLoginUser = MockLoginUser();
    loginRepositoryImpl = LoginRepositoryImpl(mockLoginUser);
  });

  group('Login User', () {
    final LoginModel tLogin =
        LoginModel(username: "user1", password: "password");
    final LoginModel tLoginCorrect =
        LoginModel(username: "user", password: "password");
    final User user = User(id: 1, user: "admin");

    test('Should call datasource', () {
      // given
      when(mockLoginUser.login(tLoginCorrect)).thenAnswer((_) async => user);
      // when
      loginRepositoryImpl.login(tLogin);
      // then
      verify(mockLoginUser.login(tLogin));
    });

    test('Should return true if login correct', () async {
      // given
      when(mockLoginUser.login(tLoginCorrect)).thenAnswer((_) async => user);
      // when
      final result = await loginRepositoryImpl.login(tLoginCorrect);
      // then
      expect(result, Right(true));
    });

    test('Should return false if login is not correct', () async {
      // given
      when(mockLoginUser.login(tLogin)).thenAnswer((_) async => null);
      // when
      final result = await loginRepositoryImpl.login(tLogin);
      // then
      expect(result, Right(false));
    });
  });
}
