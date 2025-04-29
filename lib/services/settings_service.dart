import 'package:flutter/material.dart';

class SettingsService with ChangeNotifier {
  bool _isDarkModeEnabled = false;
  double _fontSize = 16.0;

  bool get isDarkModeEnabled => _isDarkModeEnabled;
  double get fontSize => _fontSize;

  void toggleDarkMode(bool value) {
    _isDarkModeEnabled = value;
    notifyListeners();
  }

  void setFontSize(double value) {
    _fontSize = value;
    notifyListeners();
  }
}
