import 'package:flutter/material.dart';

import 'package:trent_u_class_find/universals/variables.dart';

ColorScheme? trentUColorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: Color(
    0xffdf9849,
  ),
  onPrimary: Color(
    0xff154734,
  ),
  secondary: Color(
    0xffdf9849,
  ),
  onSecondary: Color(
    0xff154734,
  ),
  error: Color(
    0xffff0000,
  ),
  onError: Color(
    0xffffa500,
  ),
  background: Color(
    0xff000000,
  ),
  onBackground: Color(
    0xff0a0a0a,
  ),
  surface: Color(
    0xff154734,
  ),
  onSurface: Color(
    0xffdf9849,
  ),
);

ThemeData? lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: trentUColorScheme!.copyWith(
    brightness: Brightness.light,
    background: const Color(
      0xffffffff,
    ),
    onBackground: const Color(
      0xfff5f5f5,
    ),
  ),
  platform: appTargetPlatform!,
);

ThemeData? darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: trentUColorScheme!.copyWith(
    brightness: Brightness.dark,
    background: const Color(
      0xff000000,
    ),
    onBackground: const Color(
      0xff0a0a0a,
    ),
  ),
  platform: appTargetPlatform!,
);
