import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  /// notify change state without deep clone state
  final int version;

  final List propss;

  LoginState(this.version, [this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  LoginState getStateCopy();

  LoginState getNewVersion();

  @override
  List<Object> get props => (propss);
}

/// UnInitialized
class UnLoginState extends LoginState {
  UnLoginState(
    int version,
  ) : super(version);

  @override
  String toString() => 'UnLoginState';

  @override
  UnLoginState getStateCopy() {
    return UnLoginState(0);
  }

  @override
  UnLoginState getNewVersion() {
    return UnLoginState(version + 1);
  }
}

/// Initialized
class InLoginState extends LoginState {
  final String hello;

  InLoginState(
    int version,
    this.hello,
  ) : super(version, [hello]);

  @override
  String toString() => 'InLoginState $hello';

  @override
  InLoginState getStateCopy() {
    return InLoginState(this.version, this.hello);
  }

  @override
  InLoginState getNewVersion() {
    return InLoginState(version + 1, this.hello);
  }
}

class ErrorLoginState extends LoginState {
  final String errorMessage;

  ErrorLoginState(
    int version,
    this.errorMessage,
  ) : super(version, [errorMessage]);

  @override
  String toString() => 'ErrorLoginState';

  @override
  ErrorLoginState getStateCopy() {
    return ErrorLoginState(this.version, this.errorMessage);
  }

  @override
  ErrorLoginState getNewVersion() {
    return ErrorLoginState(version + 1, this.errorMessage);
  }
}
