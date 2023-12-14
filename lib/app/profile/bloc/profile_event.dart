part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

final class ProfileUpdateEvent extends ProfileEvent {
  final String phone;
  final String first;
  final String last;
  final String email;

  const ProfileUpdateEvent({
    required this.phone,
    required this.first,
    required this.last,
    required this.email,
  });
  @override
  List<Object> get props => [phone, first, last, email];
}

final class ProfileLoadEvent extends ProfileEvent {}
