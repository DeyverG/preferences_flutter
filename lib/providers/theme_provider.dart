import 'package:flutter/material.dart';

/// La clase ThemeProvider es un ChangeNotifier que contiene el tema actual de la aplicación.
class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  ThemeProvider({required bool isDarkMode})
      : currentTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();

  setThemeDark() {
    currentTheme = ThemeData.dark();
    notifyListeners();
  }

  setThemeLight() {
    currentTheme = ThemeData.light();
    notifyListeners();
  }
}
