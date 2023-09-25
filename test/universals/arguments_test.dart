import 'package:flutter_test/flutter_test.dart';
import 'dart:math';

import 'package:trent_u_class_find/universals/arguments.dart';

String? generateRandomString() {
  const String charset =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#%^&*()_+[]{}|;:,.<>?';

  final Random random = Random();
  String randomString = '';

  for (int? i = 0; i! < 8; i++) {
    final int randomIndex = random.nextInt(charset.length);
    randomString += charset[randomIndex];
  }

  return randomString;
}

void main() {
  group(
    'TrentCenterArguments',
    () {
      int? centerIndex;

      TrentCenterArguments? trentCenterArguments;

      setUp(
        () {
          centerIndex = Random().nextInt(
            10,
          );
          trentCenterArguments = TrentCenterArguments(
            centerIndex: centerIndex!,
          );
        },
      );

      test(
        'centerIndex',
        () {
          expect(
            (trentCenterArguments!.centerIndex! % 1) == 0,
            true,
          );

          expect(
            trentCenterArguments!.centerIndex,
            isNotNaN,
          );

          expect(
            trentCenterArguments!.centerIndex,
            isNonZero,
          );

          expect(
            trentCenterArguments!.centerIndex,
            isNotNull,
          );

          expect(
            trentCenterArguments!.centerIndex,
            equals(
              centerIndex,
            ),
          );
        },
      );
    },
  );

  group(
    'TrentFloorArguments',
    () {
      int? centerIndex;
      int? floorIndex;

      TrentFloorArguments? trentFloorArguments;

      setUp(
        () {
          centerIndex = Random().nextInt(
            10,
          );
          floorIndex = Random().nextInt(
            10,
          );
          trentFloorArguments = TrentFloorArguments(
            centerIndex: centerIndex!,
            floorIndex: floorIndex!,
          );
        },
      );

      test(
        'centerIndex',
        () {
          expect(
            (trentFloorArguments!.centerIndex! % 1) == 0,
            true,
          );

          expect(
            trentFloorArguments!.centerIndex,
            isNotNaN,
          );

          expect(
            trentFloorArguments!.centerIndex,
            isNonZero,
          );

          expect(
            trentFloorArguments!.centerIndex,
            isNotNull,
          );

          expect(
            trentFloorArguments!.centerIndex,
            equals(
              centerIndex,
            ),
          );
        },
      );

      test(
        'floorIndex',
        () {
          expect(
            (trentFloorArguments!.floorIndex! % 1) == 0,
            true,
          );

          expect(
            trentFloorArguments!.floorIndex,
            isNotNaN,
          );

          expect(
            trentFloorArguments!.floorIndex,
            isNonZero,
          );

          expect(
            trentFloorArguments!.floorIndex,
            isNotNull,
          );

          expect(
            trentFloorArguments!.floorIndex,
            equals(
              floorIndex,
            ),
          );
        },
      );
    },
  );

  group(
    'TrentRoomArguments',
    () {
      int? centerIndex;
      int? floorIndex;
      int? roomIndex;

      TrentRoomArguments? trentRoomArguments;

      setUp(
        () {
          centerIndex = Random().nextInt(
                10,
              ) +
              1;
          floorIndex = Random().nextInt(
                10,
              ) +
              1;
          roomIndex = Random().nextInt(
                10,
              ) +
              1;
          trentRoomArguments = TrentRoomArguments(
            centerIndex: centerIndex!,
            floorIndex: floorIndex!,
            roomIndex: roomIndex!,
          );
        },
      );

      test(
        'centerIndex',
        () {
          expect(
            (trentRoomArguments!.centerIndex! % 1) == 0,
            true,
          );

          expect(
            trentRoomArguments!.centerIndex,
            isNotNaN,
          );

          expect(
            trentRoomArguments!.centerIndex,
            isNonZero,
          );

          expect(
            trentRoomArguments!.centerIndex,
            isNotNull,
          );

          expect(
            trentRoomArguments!.centerIndex,
            equals(
              centerIndex,
            ),
          );
        },
      );

      test(
        'floorIndex',
        () {
          expect(
            (trentRoomArguments!.floorIndex! % 1) == 0,
            true,
          );

          expect(
            trentRoomArguments!.floorIndex,
            isNotNaN,
          );

          expect(
            trentRoomArguments!.floorIndex,
            isNonZero,
          );

          expect(
            trentRoomArguments!.floorIndex,
            isNotNull,
          );

          expect(
            trentRoomArguments!.floorIndex,
            equals(
              floorIndex,
            ),
          );
        },
      );

      test(
        'roomIndex',
        () {
          expect(
            (trentRoomArguments!.roomIndex! % 1) == 0,
            true,
          );

          expect(
            trentRoomArguments!.roomIndex,
            isNotNaN,
          );

          expect(
            trentRoomArguments!.roomIndex,
            isNonZero,
          );

          expect(
            trentRoomArguments!.roomIndex,
            isNotNull,
          );

          expect(
            trentRoomArguments!.roomIndex,
            equals(
              roomIndex,
            ),
          );
        },
      );
    },
  );

  group(
    'TrentAppSettingsLicensePageArguments',
    () {
      String? applicationVersion;
      String? applicationLegalese;
      String? applicationName;
      String? applicationIconAssetPath;

      TrentAppSettingsLicensePageArguments?
          trentAppSettingsLicensePageArguments;

      setUp(
        () {
          applicationVersion = generateRandomString();
          applicationLegalese = generateRandomString();
          applicationName = generateRandomString();
          applicationIconAssetPath = generateRandomString();
          trentAppSettingsLicensePageArguments =
              TrentAppSettingsLicensePageArguments(
            applicationVersion: applicationVersion!,
            applicationLegalese: applicationLegalese!,
            applicationName: applicationName!,
            applicationIconAssetPath: applicationIconAssetPath!,
          );
        },
      );

      test(
        'applicationVersion',
        () {
          expect(
            trentAppSettingsLicensePageArguments!.applicationVersion,
            isA<String>(),
          );

          expect(
            trentAppSettingsLicensePageArguments!.applicationVersion,
            isNotNull,
          );

          expect(
            trentAppSettingsLicensePageArguments!.applicationVersion,
            isNotEmpty,
          );

          expect(
            trentAppSettingsLicensePageArguments!.applicationVersion,
            equals(
              applicationVersion,
            ),
          );
        },
      );

      test(
        'applicationLegalese',
        () {
          expect(
            trentAppSettingsLicensePageArguments!.applicationLegalese,
            isA<String>(),
          );

          expect(
            trentAppSettingsLicensePageArguments!.applicationLegalese,
            isNotNull,
          );

          expect(
            trentAppSettingsLicensePageArguments!.applicationLegalese,
            isNotEmpty,
          );

          expect(
            trentAppSettingsLicensePageArguments!.applicationLegalese,
            equals(
              applicationLegalese,
            ),
          );
        },
      );

      test(
        'applicationName',
        () {
          expect(
            trentAppSettingsLicensePageArguments!.applicationName,
            isA<String>(),
          );

          expect(
            trentAppSettingsLicensePageArguments!.applicationName,
            isNotNull,
          );

          expect(
            trentAppSettingsLicensePageArguments!.applicationName,
            isNotEmpty,
          );

          expect(
            trentAppSettingsLicensePageArguments!.applicationName,
            equals(
              applicationName,
            ),
          );
        },
      );

      test(
        'applicationIconAssetPath',
        () {
          expect(
            trentAppSettingsLicensePageArguments!.applicationIconAssetPath,
            isA<String>(),
          );

          expect(
            trentAppSettingsLicensePageArguments!.applicationIconAssetPath,
            isNotNull,
          );

          expect(
            trentAppSettingsLicensePageArguments!.applicationIconAssetPath,
            isNotEmpty,
          );

          expect(
            trentAppSettingsLicensePageArguments!.applicationIconAssetPath,
            equals(
              applicationIconAssetPath,
            ),
          );
        },
      );
    },
  );
}
