import 'package:tryflutter_startupnamegenerator/login/index.dart';

class LoginRepository {
  final LoginProvider _loginProvider = LoginProvider();

  LoginRepository();

  void test(bool isError) {
    this._loginProvider.test(isError);
  }
}
