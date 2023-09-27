import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:trent_u_class_locator/universals/variables.dart';

class TrentAppNotifierService with ChangeNotifier {
  ThemeMode? getThemeMode() {
    return appThemeMode;
  }

  void setThemeMode(
    ThemeMode? themeMode,
  ) {
    appThemeMode = themeMode!;

    appThemeSettingsInt = themeMode == ThemeMode.light
        ? 0
        : themeMode == ThemeMode.dark
            ? 1
            : 2;

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

  int? getImageViewQuality() {
    return appImageQualityViewSettingsInt;
  }

  void setImageViewQuality(
    int? imageQuality,
  ) {
    appImageQualityViewSettingsInt = imageQuality!;

    notifyListeners();

    SharedPreferences.getInstance().then(
      (
        SharedPreferences? prefs,
      ) {
        prefs!.setInt(
          'imageViewQuality',
          imageQuality,
        );
      },
    );
  }

  int? getImageDownloadQuality() {
    return appImageQualityDownloadSettingsInt;
  }

  void setImageDownloadQuality(
    int? imageQuality,
  ) {
    appImageQualityDownloadSettingsInt = imageQuality!;

    notifyListeners();

    SharedPreferences.getInstance().then(
      (
        SharedPreferences? prefs,
      ) {
        prefs!.setInt(
          'imageDownloadQuality',
          appImageQualityDownloadSettingsInt!,
        );
      },
    );
  }

  TrentAppNotifierService() {
    SharedPreferences.getInstance().then(
      (
        SharedPreferences? prefs,
      ) {
        String? themeModeString = prefs!.getString(
          'themeMode',
        );

        int? imageDownloadQualityInt = prefs.getInt(
          'imageDownloadQuality',
        );

        int? imageViewQualityInt = prefs.getInt(
          'imageViewQuality',
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

        setImageDownloadQuality(
          imageDownloadQualityInt ?? 1,
        );

        setImageViewQuality(
          imageViewQualityInt ?? 1,
        );
      },
    );
  }
}
