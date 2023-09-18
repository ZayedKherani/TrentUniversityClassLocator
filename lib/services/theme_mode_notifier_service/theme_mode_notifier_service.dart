import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:trent_u_class_find/universals/variables.dart';

class ThemeModeNotifierService with ChangeNotifier {
  ThemeMode? getThemeMode() {
    return appThemeMode;
  }

  void setThemeMode(
    ThemeMode? themeMode,
  ) {
    appThemeMode = themeMode!;

    // SETTINGS APP RADIO CONTROL
    // appThemeSettingsInt = themeMode == ThemeMode.light
    //     ? 0
    //     : themeMode == ThemeMode.dark
    //         ? 1
    //         : 2;

    notifyListeners();

    SharedPreferences.getInstance().then(
      (
        SharedPreferences? prefs,
      ) {
        prefs!.setString(
          'themeMode',
          themeMode.name,
        );
      },
    );
  }

  ThemeModeNotifierService() {
    SharedPreferences.getInstance().then(
      (
        SharedPreferences? prefs,
      ) {
        String? themeModeString = prefs!.getString(
          'themeMode',
        );

        setThemeMode(
          ThemeMode.values.firstWhere(
            (
              ThemeMode? themeModeInstance,
            ) =>
                themeModeInstance!.name == themeModeString,
            orElse: () => ThemeMode.system,
          ),
        );
      },
    );
  }
}
