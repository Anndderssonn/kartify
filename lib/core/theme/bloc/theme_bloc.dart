import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartify/core/theme/theme_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemePreferences _themePreferences;

  ThemeBloc({required ThemePreferences themePreferences})
    : _themePreferences = themePreferences,
      super(ThemeState(themeMode: themePreferences.loadTheme())) {
    on<ThemeChanged>(_onThemeChanged);
  }

  Future<void> _onThemeChanged(
    ThemeChanged event,
    Emitter<ThemeState> emit,
  ) async {
    await _themePreferences.saveTheme(event.themeMode);
    emit(ThemeState(themeMode: event.themeMode));
  }
}
