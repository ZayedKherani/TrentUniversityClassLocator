import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:trent_u_class_find/services/theme_mode_notifier_service/theme_mode_notifier_service.dart';
import 'package:trent_u_class_find/universals/variables.dart';

class MockCallbackFunction extends Mock {
  call();
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUp(
    () {
      SharedPreferences.setMockInitialValues(
        {},
      );
    },
  );

  test(
    'ThemeModeNotifierService.getThemeMode',
    () {
      final themeModeNotifierService = ThemeModeNotifierService();

      expect(
        themeModeNotifierService.getThemeMode(),
        ThemeMode.system,
      );
    },
  );

  test(
    'ThemeModeNotifierService()',
    () {
      final themeModeNotifierService = ThemeModeNotifierService();

      expect(
        appThemeMode,
        ThemeMode.system,
      );

      expect(
        appThemeSettingsInt,
        2,
      );

      expect(
        themeModeNotifierService,
        isA<ThemeModeNotifierService>(),
      );
    },
  );

  group(
    'ThemeModeNotifierService.setThemeMode',
    () {
      late ThemeModeNotifierService themeModeNotifierService;

      final notifyListenerCallback = MockCallbackFunction();

      setUp(
        () {
          themeModeNotifierService = ThemeModeNotifierService()
            ..addListener(
              notifyListenerCallback,
            );

          reset(
            notifyListenerCallback,
          );
        },
      );

      test(
        'Set Theme To Dark Mode',
        () {
          themeModeNotifierService.setThemeMode(
            ThemeMode.dark,
          );

          expect(
            appThemeMode,
            ThemeMode.dark,
          );

          expect(
            appThemeSettingsInt,
            1,
          );

          verify(
            notifyListenerCallback(),
          ).called(
            1,
          );
        },
      );

      test(
        'Set Theme To Light Mode',
        () {
          themeModeNotifierService.setThemeMode(
            ThemeMode.light,
          );

          expect(
            appThemeMode,
            ThemeMode.light,
          );

          expect(
            appThemeSettingsInt,
            0,
          );

          verify(
            notifyListenerCallback(),
          ).called(
            1,
          );
        },
      );

      test(
        'Set Theme To System Mode',
        () {
          themeModeNotifierService.setThemeMode(
            ThemeMode.system,
          );

          expect(
            appThemeMode,
            ThemeMode.system,
          );

          expect(
            appThemeSettingsInt,
            2,
          );

          verify(
            notifyListenerCallback(),
          ).called(
            1,
          );
        },
      );
    },
  );
}
