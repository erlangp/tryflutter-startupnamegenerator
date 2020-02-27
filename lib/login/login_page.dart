import 'package:flutter/material.dart';
import 'package:tryflutter_startupnamegenerator/login/index.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    var loginBloc = LoginBloc();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: LoginScreen(
        loginBloc: loginBloc,
      ),
    );
  }
}
