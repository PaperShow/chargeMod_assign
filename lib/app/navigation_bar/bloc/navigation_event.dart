part of 'navigation_bloc.dart';

sealed class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class TabChangeEvent extends NavigationEvent {
  final int tabIndex;

  const TabChangeEvent({required this.tabIndex});
  @override
  List<Object> get props => [tabIndex];
}
