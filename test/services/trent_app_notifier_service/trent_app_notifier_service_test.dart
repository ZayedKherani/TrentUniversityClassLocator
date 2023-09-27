import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:trent_u_class_locator/services/trent_app_notifier_service/trent_app_notifier_service.dart';
import 'package:trent_u_class_locator/universals/variables.dart';

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
    'TrentAppNotifierService()',
    () {
      final TrentAppNotifierService trentAppNotifierService =
          TrentAppNotifierService();

      expect(
        appThemeMode,
        ThemeMode.system,
      );

      expect(
        appThemeSettingsInt,
        2,
      );

      expect(
        trentAppNotifierService,
        isA<TrentAppNotifierService>(),
      );
    },
  );

  test(
    'TrentAppNotifierService.getThemeMode',
    () {
      final TrentAppNotifierService trentAppNotifierService =
          TrentAppNotifierService();

      expect(
        trentAppNotifierService.getThemeMode(),
        ThemeMode.system,
      );
    },
  );

  group(
    'TrentAppNotifierService.setThemeMode',
    () {
      late TrentAppNotifierService trentAppNotifierService;

      final MockCallbackFunction notifyListenerCallback =
          MockCallbackFunction();

      setUp(
        () {
          trentAppNotifierService = TrentAppNotifierService()
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
          trentAppNotifierService.setThemeMode(
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
          trentAppNotifierService.setThemeMode(
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
          trentAppNotifierService.setThemeMode(
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

  test(
    'TrentAppNotifierService.getImageViewQuality',
    () {
      final TrentAppNotifierService trentAppNotifierService =
          TrentAppNotifierService();

      expect(
        trentAppNotifierService.getImageViewQuality(),
        1,
      );
    },
  );

  group(
    'TrentAppNotifierService.setImageViewQuality',
    () {
      late TrentAppNotifierService trentAppNotifierService;

      final MockCallbackFunction notifyListenerCallback =
          MockCallbackFunction();

      setUp(
        () {
          trentAppNotifierService = TrentAppNotifierService()
            ..addListener(
              notifyListenerCallback,
            );

          reset(
            notifyListenerCallback,
          );
        },
      );

      test(
        'Set Theme To 1080',
        () {
          trentAppNotifierService.setImageViewQuality(
            1,
          );

          expect(
            appImageQualityViewSettingsInt,
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
        'Set Theme To 720',
        () {
          trentAppNotifierService.setImageViewQuality(
            0,
          );

          expect(
            appImageQualityViewSettingsInt,
            0,
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

  test(
    'TrentAppNotifierService.getImageDownloadQuality',
    () {
      final TrentAppNotifierService trentAppNotifierService =
          TrentAppNotifierService();

      expect(
        trentAppNotifierService.getImageDownloadQuality(),
        1,
      );
    },
  );

  group(
    'TrentAppNotifierService.setImageDownloadQuality',
    () {
      late TrentAppNotifierService trentAppNotifierService;

      final MockCallbackFunction notifyListenerCallback =
          MockCallbackFunction();

      setUp(
        () {
          trentAppNotifierService = TrentAppNotifierService()
            ..addListener(
              notifyListenerCallback,
            );

          reset(
            notifyListenerCallback,
          );
        },
      );

      test(
        'Set Theme To 1080',
        () {
          trentAppNotifierService.setImageDownloadQuality(
            1,
          );

          expect(
            appImageQualityDownloadSettingsInt,
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
        'Set Theme To 720',
        () {
          trentAppNotifierService.setImageDownloadQuality(
            0,
          );

          expect(
            appImageQualityDownloadSettingsInt,
            0,
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
