import 'package:flutter/material.dart';

extension TextThemeStylesX on BuildContext {
  TextStyle get bodyText1 => Theme.of(this).textTheme.bodyLarge!;

  TextStyle get bodyText2 => Theme.of(this).textTheme.bodyMedium!;

  TextStyle get subtitle1 => Theme.of(this).textTheme.titleMedium!;

  TextStyle get subtitle2 => Theme.of(this).textTheme.titleSmall!;

  TextStyle get headline1 => Theme.of(this).textTheme.displayLarge!;

  TextStyle get headline2 => Theme.of(this).textTheme.displayMedium!;

  TextStyle get headline3 => Theme.of(this).textTheme.displaySmall!;

  TextStyle get headline4 => Theme.of(this).textTheme.headlineMedium!;

  TextStyle get headline5 => Theme.of(this).textTheme.headlineSmall!;

  TextStyle get headline6 => Theme.of(this).textTheme.titleLarge!;
}
