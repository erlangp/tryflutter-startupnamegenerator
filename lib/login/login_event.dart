import 'dart:async';
import 'dart:developer' as developer;

import 'package:tryflutter_startupnamegenerator/login/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent {
  final LoginRepository _loginRepository = LoginRepository();

  Future<LoginState> applyAsync({
    LoginState currentState,
    LoginBloc bloc,
  });
}

class UnLoginEvent extends LoginEvent {
  @override
  Future<LoginState> applyAsync({
    LoginState currentState,
    LoginBloc bloc,
  }) async {
    return UnLoginState(0);
  }
}

class LoadLoginEvent extends LoginEvent {
  final bool isError;

  LoadLoginEvent(this.isError);

  @override
  String toString() => 'LoadLoginEvent';

  @override
  Future<LoginState> applyAsync({
    LoginState currentState,
    LoginBloc bloc,
  }) async {
    try {
      if (currentState is InLoginState) {
        return currentState.getNewVersion();
      }
      await Future.delayed(Duration(seconds: 2));
      this._loginRepository.test(this.isError);
      return InLoginState(0, 'Hello world');
    } catch (_, stackTrace) {
      developer.log(
        '$_',
        name: 'LoadLoginEvent',
        error: _,
        stackTrace: stackTrace,
      );
      return ErrorLoginState(0, _?.toString());
    }
  }
}
