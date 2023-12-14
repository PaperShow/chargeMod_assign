part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class UnAuthenticated extends AuthState {}

final class OTPSentState extends AuthState {}

final class OTPReSentState extends AuthState {}

final class AuthLoading extends AuthState {}

final class Authenticated extends AuthState {}

final class AuthError extends AuthState {
  final String error;

  const AuthError({required this.error});
  @override
  List<Object> get props => [error];
}
