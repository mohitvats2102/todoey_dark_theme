import 'package:flutter/material.dart';

class CurrentThemeProvider extends ChangeNotifier {
  bool isDark = false;
  ThemeMode currentTheme() {
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
