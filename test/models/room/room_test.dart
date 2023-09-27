import 'package:flutter_test/flutter_test.dart';
import 'dart:math';

import 'package:trent_u_class_locator/models/enums/enums.dart';
import 'package:trent_u_class_locator/models/room/room.dart';
import 'package:trent_u_class_locator/models/step/step.dart';
import 'package:trent_u_class_locator/models/steps/steps.dart';

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

TrentCenters? generateRandomTrentCenter() =>
    TrentCenters.values[Random().nextInt(
      TrentCenters.values.length,
    )];

void main() {
  group(
    'Room',
    () {
      TrentRoomModel? room;

      String? roomNumber;
      String? roomFloor;
      TrentCenters? roomCenter;
      String? roomType;
      String? roomCapacity;
      String? centerCode;
      String? reviewImageAssetPath;
      String? hDImageAssetPath;
      String? fHDImageAssetPath;

      setUp(
        () {
          roomNumber = generateRandomString();
          roomFloor = generateRandomString();
          roomCenter = generateRandomTrentCenter();
          roomType = generateRandomString();
          roomCapacity = generateRandomString();
          centerCode = generateRandomString();
          reviewImageAssetPath = generateRandomString();
          hDImageAssetPath = generateRandomString();
          fHDImageAssetPath = generateRandomString();

          room = TrentRoomModel(
            roomNumber: roomNumber,
            roomFloor: roomFloor,
            roomCenter: roomCenter,
            roomType: roomType,
            roomCapacity: roomCapacity,
            centerCode: centerCode,
            reviewImageAssetPath: reviewImageAssetPath,
            hDImageAssetPath: hDImageAssetPath,
            fHDImageAssetPath: fHDImageAssetPath,
            findRoomSteps: const TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: "NO DATA",
                  stepDescription: "NO DATA",
                  stepSmallImageAssetPath: "NO DATA",
                  stepHDImageAssetPath: "NO DATA",
                  stepFHDImageAssetPath: "NO DATA",
                ),
              ],
            ),
          );
        },
      );

      test(
        'roomNumber',
        () {
          expect(
            room!.roomNumber,
            isA<String>(),
          );

          expect(
            room!.roomNumber,
            isNotNull,
          );

          expect(
            room!.roomNumber,
            isNotEmpty,
          );

          expect(
            room!.roomNumber,
            roomNumber,
          );
        },
      );

      test(
        'roomFloor',
        () {
          expect(
            room!.roomFloor,
            isA<String>(),
          );

          expect(
            room!.roomFloor,
            isNotNull,
          );

          expect(
            room!.roomFloor,
            isNotEmpty,
          );

          expect(
            room!.roomFloor,
            roomFloor,
          );
        },
      );

      test(
        'roomCenter',
        () {
          expect(
            room!.roomCenter,
            isA<TrentCenters>(),
          );

          expect(
            room!.roomCenter,
            isNotNull,
          );

          expect(
            room!.roomCenter,
            roomCenter,
          );
        },
      );

      test(
        'roomType',
        () {
          expect(
            room!.roomType,
            isA<String>(),
          );

          expect(
            room!.roomType,
            isNotNull,
          );

          expect(
            room!.roomType,
            isNotEmpty,
          );

          expect(
            room!.roomType,
            roomType,
          );
        },
      );

      test(
        'roomCapacity',
        () {
          expect(
            room!.roomCapacity,
            isA<String>(),
          );

          expect(
            room!.roomCapacity,
            isNotNull,
          );

          expect(
            room!.roomCapacity,
            isNotEmpty,
          );

          expect(
            room!.roomCapacity,
            roomCapacity,
          );
        },
      );

      test(
        'centerCode',
        () {
          expect(
            room!.centerCode,
            isA<String>(),
          );

          expect(
            room!.centerCode,
            isNotNull,
          );

          expect(
            room!.centerCode,
            isNotEmpty,
          );

          expect(
            room!.centerCode,
            centerCode,
          );
        },
      );

      test(
        'reviewImageAssetPath',
        () {
          expect(
            room!.reviewImageAssetPath,
            isA<String>(),
          );

          expect(
            room!.reviewImageAssetPath,
            isNotNull,
          );

          expect(
            room!.reviewImageAssetPath,
            isNotEmpty,
          );

          expect(
            room!.reviewImageAssetPath,
            reviewImageAssetPath,
          );
        },
      );

      test(
        'hDImageAssetPath',
        () {
          expect(
            room!.hDImageAssetPath,
            isA<String>(),
          );

          expect(
            room!.hDImageAssetPath,
            isNotNull,
          );

          expect(
            room!.hDImageAssetPath,
            isNotEmpty,
          );

          expect(
            room!.hDImageAssetPath,
            hDImageAssetPath,
          );
        },
      );

      test(
        'fHDImageAssetPath',
        () {
          expect(
            room!.fHDImageAssetPath,
            isA<String>(),
          );

          expect(
            room!.fHDImageAssetPath,
            isNotNull,
          );

          expect(
            room!.fHDImageAssetPath,
            isNotEmpty,
          );

          expect(
            room!.fHDImageAssetPath,
            fHDImageAssetPath,
          );
        },
      );
    },
  );
}
