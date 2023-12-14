part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class SendOTPEvent extends AuthEvent {
  final String phone;

  const SendOTPEvent({required this.phone});
  @override
  List<Object> get props => [phone];
}

final class ReSendOTPEvent extends AuthEvent {
  final String phone;

  const ReSendOTPEvent({required this.phone});
  @override
  List<Object> get props => [phone];
}

final class VerifyOTPEvent extends AuthEvent {
  final String phone;
  final String otp;

  const VerifyOTPEvent({required this.otp, required this.phone});
  @override
  List<Object> get props => [phone, otp];
}

final class LogOutEvent extends AuthEvent {}
