import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:myapp/features/login/domain/entities/login_model.dart';
import 'package:myapp/features/login/domain/repositories/login_repository.dart';
import 'package:myapp/features/login/domain/usecases/login_with_credentials.dart';
import 'package:mockito/mockito.dart';

import 'login_test.mocks.dart';

@GenerateMocks([LoginRepository])
main() {
  late MockLoginRepository mockLoginRepository;
  late LoginWithCredentials usecase;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    usecase = LoginWithCredentials(mockLoginRepository);
  });

  final tLogin = LoginModel(username: "foo", password: "bar");
  test('should login with provided credentials', () async {
    // given
    when(mockLoginRepository.login(any)).thenAnswer((_) async => Right(true));
    // when
    final result = await usecase(Params(login: tLogin));
    // then
    expect(result, Right(true));
    verify(mockLoginRepository.login(tLogin)).called(1);
    verifyNoMoreInteractions(mockLoginRepository);
  });
}
