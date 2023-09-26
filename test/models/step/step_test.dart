import 'package:flutter_test/flutter_test.dart';
import 'dart:math';

import 'package:trent_u_class_find/models/step/step.dart';

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
    'TrentRoomFindStep',
    () {
      String? stepNumber;
      String? stepDescription;

      String? stepSmallImageAssetPath;
      String? stepHDImageAssetPath;
      String? stepFHDImageAssetPath;

      TrentRoomFindStep? step;

      setUp(
        () {
          stepNumber = generateRandomString();
          stepDescription = generateRandomString();

          stepSmallImageAssetPath = generateRandomString();
          stepHDImageAssetPath = generateRandomString();
          stepFHDImageAssetPath = generateRandomString();

          step = TrentRoomFindStep(
            stepNumber: stepNumber,
            stepDescription: stepDescription,
            stepSmallImageAssetPath: stepSmallImageAssetPath,
            stepHDImageAssetPath: stepHDImageAssetPath,
            stepFHDImageAssetPath: stepFHDImageAssetPath,
          );
        },
      );

      test(
        'stepNumber',
        () {
          expect(
            step!.stepNumber,
            isA<String?>(),
          );

          expect(
            step!.stepNumber,
            isNotNull,
          );

          expect(
            step!.stepNumber,
            isNotEmpty,
          );

          expect(
            step!.stepNumber,
            equals(
              stepNumber,
            ),
          );
        },
      );

      test(
        'stepDescription',
        () {
          expect(
            step!.stepDescription,
            isA<String?>(),
          );

          expect(
            step!.stepDescription,
            isNotNull,
          );

          expect(
            step!.stepDescription,
            isNotEmpty,
          );

          expect(
            step!.stepDescription,
            equals(
              stepDescription,
            ),
          );
        },
      );

      test(
        'stepSmallImageAssetPath',
        () {
          expect(
            step!.stepSmallImageAssetPath,
            isA<String?>(),
          );

          expect(
            step!.stepSmallImageAssetPath,
            isNotNull,
          );

          expect(
            step!.stepSmallImageAssetPath,
            isNotEmpty,
          );

          expect(
            step!.stepSmallImageAssetPath,
            equals(
              stepSmallImageAssetPath,
            ),
          );
        },
      );

      test(
        'stepHDImageAssetPath',
        () {
          expect(
            step!.stepHDImageAssetPath,
            isA<String?>(),
          );

          expect(
            step!.stepHDImageAssetPath,
            isNotNull,
          );

          expect(
            step!.stepHDImageAssetPath,
            isNotEmpty,
          );

          expect(
            step!.stepHDImageAssetPath,
            equals(
              stepHDImageAssetPath,
            ),
          );
        },
      );

      test(
        'stepFHDImageAssetPath',
        () {
          expect(
            step!.stepFHDImageAssetPath,
            isA<String?>(),
          );

          expect(
            step!.stepFHDImageAssetPath,
            isNotNull,
          );

          expect(
            step!.stepFHDImageAssetPath,
            isNotEmpty,
          );

          expect(
            step!.stepFHDImageAssetPath,
            equals(
              stepFHDImageAssetPath,
            ),
          );
        },
      );
    },
  );
}
