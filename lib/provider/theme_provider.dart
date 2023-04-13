import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/theme_settings.dart';
import 'package:flutter_application_2/settings/styles_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();
  ThemeData get currentTheme => _currentTheme;

  ThemeData temaClaro = ThemeData.light();
  ThemeData temaOscuro = ThemeData.dark();
  ThemeData temaPersonalizado = ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(primary: Colors.green, secondary: Colors.red));

  ThemeProvider(bool isDark, bool isLight) {
    if (isDark) {
      _currentTheme = temaOscuro;
    } else {
      if (isLight) {
        _currentTheme = temaClaro;
      } else {
        _currentTheme = temaPersonalizado;
      }
    }
  }

  void TemaOscuro() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (_currentTheme == temaClaro || _currentTheme == temaPersonalizado) {
      _currentTheme = temaOscuro;
      sharedPreferences.setBool('is_dark', true);
      sharedPreferences.setBool('is_light', false);
    }
    notifyListeners();
  }

  void TemaClaro() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (_currentTheme == temaOscuro || _currentTheme == temaPersonalizado) {
      _currentTheme = temaClaro;
      sharedPreferences.setBool('is_dark', false);
      sharedPreferences.setBool('is_light', true);
    }
    notifyListeners();
  }

  void TemaPersonalizado() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (_currentTheme == temaClaro || _currentTheme == temaOscuro) {
      _currentTheme = temaPersonalizado;
      sharedPreferences.setBool('is_dark', false);
      sharedPreferences.setBool('is_light', false);
    }
    notifyListeners();
  }
}