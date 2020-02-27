import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tryflutter_startupnamegenerator/login/index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key key,
    @required LoginBloc loginBloc,
  })  : _loginBloc = loginBloc,
        super(key: key);

  final LoginBloc _loginBloc;

  @override
  LoginScreenState createState() {
    return LoginScreenState(_loginBloc);
  }
}

class LoginScreenState extends State<LoginScreen> {
  final LoginBloc _loginBloc;
  LoginScreenState(this._loginBloc);

  @override
  void initState() {
    super.initState();
    this._load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        bloc: widget._loginBloc,
        builder: (
          BuildContext context,
          LoginState currentState,
        ) {
          if (currentState is UnLoginState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorLoginState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage ?? 'Error'),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('reload'),
                    onPressed: () => this._load(),
                  ),
                ),
              ],
            ));
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Flutter files: done'),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.red,
                    child: Text('throw error'),
                    onPressed: () => this._load(true),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _load([bool isError = false]) {
    widget._loginBloc.add(UnLoginEvent());
    widget._loginBloc.add(LoadLoginEvent(isError));
  }
}
