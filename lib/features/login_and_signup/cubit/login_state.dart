part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginModel massage;

  LoginSuccess({required this.massage});
}

final class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});
}
