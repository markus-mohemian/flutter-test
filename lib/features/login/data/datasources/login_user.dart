import '../../domain/entities/login_model.dart';
import '../models/user.dart';

class LoginUser {
  Future<User?> login(LoginModel login) async {
    if (login.username == "user" && login.password == "password") {
      return User(id: 1, user: "admin");
    } else {
      return null;
    }
  }
}
