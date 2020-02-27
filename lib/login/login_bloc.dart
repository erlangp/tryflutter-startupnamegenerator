import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:tryflutter_startupnamegenerator/login/index.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // TODO: check singleton for logic in project
  static final LoginBloc _loginBlocSingleton = LoginBloc._internal();

  factory LoginBloc() {
    return _loginBlocSingleton;
  }

  LoginBloc._internal();

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  LoginState get initialState => UnLoginState(0);

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    try {
      yield await event.applyAsync(
        currentState: state,
        bloc: this,
      );
    } catch (_, stackTrace) {
      developer.log(
        '$_',
        name: 'LoginBloc',
        error: _,
        stackTrace: stackTrace,
      );
      yield state;
    }
  }
}
