// lib/core/theme/theme_preferences_impl.dart
import 'package:flutter/material.dart';
import 'package:kartify/core/theme/theme_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferencesImpl implements ThemePreferences {
  static const _themeKey = 'theme_mode';
  final SharedPreferences _prefs;

  ThemePreferencesImpl({required SharedPreferences prefs}) : _prefs = prefs;

  @override
  ThemeMode loadTheme() {
    final saved = _prefs.getString(_themeKey);
    if (saved == null) return ThemeMode.light;
    return ThemeMode.values.firstWhere(
      (e) => e.name == saved,
      orElse: () => ThemeMode.light,
    );
  }

  @override
  Future<void> saveTheme(ThemeMode mode) async {
    await _prefs.setString(_themeKey, mode.name);
  }
}
