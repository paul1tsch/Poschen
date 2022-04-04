import 'package:flutter/material.dart';
import 'package:poschen/utils.dart';

class Constants {
  static final MaterialColor primary =
      createMaterialColor(const Color(0x166534));
  static const Color light = Color(0xFFFFFF);

  static const TextStyle _defaultTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
  );

  static final theme = ThemeData.from(
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
    colorScheme: ColorScheme.fromSwatch(
      accentColor: light,
      backgroundColor: primary,
      brightness: ThemeData.estimateBrightnessForColor(primary),
      primarySwatch: primary,
      primaryColorDark: light,
      cardColor: primary,
    ),
  ).copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(light),
        foregroundColor: MaterialStateProperty.all(primary),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(light.withOpacity(0.25)),
        foregroundColor: MaterialStateProperty.all(light),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: light,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: false,
      selectedLabelStyle: _defaultTextStyle.copyWith(
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
