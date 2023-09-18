import 'package:flutter/material.dart';

import 'package:trent_u_class_find/universals/variables.dart';

ThemeData? lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xffdf9849),
    onPrimary: Color(0xff154734),
    secondary: Color(0xff154734),
    onSecondary: Color(0xffdf9849),
    error: Color(0xffff0000),
    onError: Color(0xffffa500),
    background: Color(0xffffffff),
    onBackground: Color(0xfff5f5f5),
    surface: Color(0xff154734),
    onSurface: Color(0xffdf9849),
  ),
  platform: appTargetPlatform!,
);

ThemeData? darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xffdf9849),
    onPrimary: Color(0xff154734),
    secondary: Color(0xff154734),
    onSecondary: Color(0xffdf9849),
    error: Color(0xffff0000),
    onError: Color(0xffffa500),
    background: Color(0xff000000),
    onBackground: Color(0xff0a0a0a),
    surface: Color(0xff154734),
    onSurface: Color(0xffdf9849),
  ),
  platform: appTargetPlatform!,
);
