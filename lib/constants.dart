import 'package:flutter/material.dart';

class Constants {
  static const MaterialColor darkGreen = MaterialColor (
    _darkGreenValue,
    <int, Color>{
      50: Color(0xFF8AB299),
      100: Color(0xFF73A285),
      200: Color(0xFF5B9370),
      300: Color(0xFF44835C),
      400: Color(0xFF2d7448),
      500: Color(_darkGreenValue),
      600: Color(0xFF135A2E),
      700: Color(0xFF115029),
      800: Color(0xFF0F4624),
      900: Color(0xFF0D3C1F),
    },
  );
  static const int _darkGreenValue = 0xFF166534;

  static const MaterialColor lightGreen = MaterialColor (
    _lightGreenValue,
    <int, Color>{
      50: Color(0xFF90E2AE),
      100: Color(0xFF7ADC9E),
      200: Color(0xFF64D68E),
      300: Color(0xFF4ED07E),
      400: Color(0xFF38CA6E),
      500: Color(_lightGreenValue),
      600: Color(0xFF1EB154),
      700: Color(0xFF1B9D4B),
      800: Color(0xFF178941),
      900: Color(0xFF147638),
    },
  );
  static const int _lightGreenValue = 0xFF22C55E;

  static const TextStyle _defaultTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
  );

  static final theme = ThemeData(
    primaryColor: darkGreen,
    backgroundColor: lightGreen,
    canvasColor: lightGreen,

    textTheme: TextTheme(
      bodyText2: _defaultTextStyle,
      button: _defaultTextStyle,
      subtitle1: _defaultTextStyle,
      overline: _defaultTextStyle.copyWith(
        fontSize: 20,
      ),
      headline1: _defaultTextStyle.copyWith(
        fontSize: 36,
        fontWeight: FontWeight.w500,
      ),
    ),
  ).copyWith(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
  );
}
