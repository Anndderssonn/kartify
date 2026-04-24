import 'package:flutter/material.dart';

abstract class ThemePreferences {
  ThemeMode loadTheme();
  Future<void> saveTheme(ThemeMode mode);
}
