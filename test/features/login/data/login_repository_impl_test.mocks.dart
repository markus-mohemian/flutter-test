// Mocks generated by Mockito 5.0.4 from annotations
// in myapp/test/features/login/data/login_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:myapp/features/login/data/datasources/login_user.dart' as _i3;
import 'package:myapp/features/login/data/models/user.dart' as _i2;
import 'package:myapp/features/login/domain/entities/login_model.dart' as _i5;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakeUser extends _i1.Fake implements _i2.User {}

/// A class which mocks [LoginUser].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginUser extends _i1.Mock implements _i3.LoginUser {
  MockLoginUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.User?> login(_i5.LoginModel? login) =>
      (super.noSuchMethod(Invocation.method(#login, [login]),
              returnValue: Future<_i2.User?>.value(_FakeUser()))
          as _i4.Future<_i2.User?>);
}
