part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileUpdated extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final UserDetailResponse user;
  const ProfileLoaded({required this.user});

  @override
  List<Object> get props => [user];
}

final class ProfileError extends ProfileState {
  final String error;

  const ProfileError({required this.error});
  @override
  List<Object> get props => [error];
}
