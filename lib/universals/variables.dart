import 'package:flutter/material.dart';

import 'package:trent_u_class_find/services/theme_mode_notifier_service/theme_mode_notifier_service.dart';

ThemeMode? appThemeMode = ThemeMode.system;

TargetPlatform? appTargetPlatform = TargetPlatform.android;

// SETTINGS APP RADIO CONTROL
// int? appThemeSettingsInt = 2;

ThemeModeNotifierService? globalThemeModeNotifier;
