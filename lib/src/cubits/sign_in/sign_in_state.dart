part of 'sign_in_cubit.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [UniqueKey()];
}

class SignInInitial extends SignInState {}

class SignInSucess extends SignInState {
  final SignInResult result;

  SignInSucess(this.result);
}

class SignInFail extends SignInState {
  final String msg;

  const SignInFail(this.msg);
}

class SignInLoading extends SignInState {}
