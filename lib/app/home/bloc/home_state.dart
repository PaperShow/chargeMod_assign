part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class LocationLoaded extends HomeState {
  final LocationResponse location;

  const LocationLoaded({required this.location});
  @override
  List<Object> get props => [location];
}

final class LocationLoading extends HomeState {}

final class HomeError extends HomeState {
  final String error;

  const HomeError({required this.error});
  @override
  List<Object> get props => [error];
}
