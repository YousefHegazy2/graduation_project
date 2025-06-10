part of 'sinup_cubit.dart';

@immutable
sealed class SinupState {}

final class SinupInitial extends SinupState {}
final class SinupLoading extends SinupState {}
final class SinupSuccess extends SinupState {
final String massage;

  SinupSuccess({required this.massage});
}
final class SinupFailure extends SinupState {
  final String error;

  SinupFailure({required this.error});
}