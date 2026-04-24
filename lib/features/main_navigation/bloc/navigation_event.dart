part of 'navigation_bloc.dart';

sealed class NavigationEvent {}

final class NavigationTabChanged extends NavigationEvent {
  final int tabIndex;
  NavigationTabChanged({required this.tabIndex});
}
