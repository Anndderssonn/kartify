part of 'theme_bloc.dart';

sealed class ThemeEvent {}

final class ThemeChanged extends ThemeEvent {
  final ThemeMode themeMode;
  ThemeChanged({required this.themeMode});
}
