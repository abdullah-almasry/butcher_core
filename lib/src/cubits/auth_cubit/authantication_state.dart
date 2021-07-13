part of 'authantication_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [UniqueKey()];
}

class LoggedIn extends AuthState {
  final AppUser user;
  const LoggedIn(this.user);
}

class LoggedOut extends AuthState {
  const LoggedOut();
}

class NotLogin extends AuthState {
  const NotLogin();
}
