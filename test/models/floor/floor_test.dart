import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:math';

import 'package:trent_u_class_find/models/enums/enums.dart';
import 'package:trent_u_class_find/models/floor/floor.dart';
import 'package:trent_u_class_find/models/room/room.dart';
import 'package:trent_u_class_find/models/step/step.dart';
import 'package:trent_u_class_find/models/steps/steps.dart';

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
    'Floor',
    () {
      TrentFloorModel? floor;
      TrentRoomModel? room;

      String? roomNumber;
      String? roomFloor;
      String? roomType;
      String? roomCapacity;
      String? centerCode;
      String? reviewImageAssetPath;
      String? hDImageAssetPath;
      String? fHDImageAssetPath;

      String? floorNumber;
      String? floorName;

      TrentCenters? floorCenter;

      ExpansionTileController? expansionTileController;

      List<TrentRoomModel?>? rooms;

      setUp(
        () {
          roomNumber = generateRandomString();
          roomFloor = generateRandomString();
          roomType = generateRandomString();
          roomCapacity = generateRandomString();
          centerCode = generateRandomString();
          reviewImageAssetPath = generateRandomString();
          hDImageAssetPath = generateRandomString();
          fHDImageAssetPath = generateRandomString();

          floorNumber = generateRandomString();
          floorName = generateRandomString();

          floorCenter = generateRandomTrentCenter();

          expansionTileController = ExpansionTileController();

          room = TrentRoomModel(
            roomNumber: roomNumber,
            roomFloor: roomFloor,
            roomCenter: floorCenter,
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

          rooms = <TrentRoomModel?>[
            room,
          ];

          floor = TrentFloorModel(
            floorNumber: floorNumber,
            floorName: floorName,
            floorCenter: floorCenter,
            rooms: rooms,
            expansionTileController: expansionTileController,
          );
        },
      );

      test(
        'floorNumber',
        () {
          expect(
            floor!.floorNumber,
            isA<String>(),
          );

          expect(
            floor!.floorNumber,
            isNotNull,
          );

          expect(
            floor!.floorNumber,
            isNotEmpty,
          );

          expect(
            floor!.floorNumber,
            equals(
              floorNumber,
            ),
          );
        },
      );

      test(
        'floorName',
        () {
          expect(
            floor!.floorName,
            isA<String>(),
          );

          expect(
            floor!.floorName,
            isNotNull,
          );

          expect(
            floor!.floorName,
            isNotEmpty,
          );

          expect(
            floor!.floorName,
            equals(
              floorName,
            ),
          );
        },
      );

      test(
        'floorCenter',
        () {
          expect(
            floor!.floorCenter,
            isA<TrentCenters>(),
          );

          expect(
            floor!.floorCenter,
            isNotNull,
          );

          expect(
            floor!.floorCenter,
            equals(
              floorCenter,
            ),
          );
        },
      );

      test(
        'expansionTileController',
        () {
          expect(
            floor!.expansionTileController,
            isA<ExpansionTileController>(),
          );

          expect(
            floor!.expansionTileController,
            isNotNull,
          );

          expect(
            floor!.expansionTileController,
            equals(
              expansionTileController,
            ),
          );
        },
      );

      test(
        'rooms',
        () {
          expect(
            floor!.rooms,
            isA<List<TrentRoomModel?>?>(),
          );

          expect(
            floor!.rooms,
            isNotNull,
          );

          expect(
            floor!.rooms,
            isNotEmpty,
          );

          expect(
            floor!.rooms,
            equals(
              rooms,
            ),
          );
        },
      );

      group(
        'Room',
        () {
          test(
            'roomNumber',
            () {
              expect(
                floor!.rooms![0]!.roomNumber,
                isA<String>(),
              );

              expect(
                floor!.rooms![0]!.roomNumber,
                isNotNull,
              );

              expect(
                floor!.rooms![0]!.roomNumber,
                isNotEmpty,
              );

              expect(
                floor!.rooms![0]!.roomNumber,
                roomNumber,
              );
            },
          );

          test(
            'roomFloor',
            () {
              expect(
                floor!.rooms![0]!.roomFloor,
                isA<String>(),
              );

              expect(
                floor!.rooms![0]!.roomFloor,
                isNotNull,
              );

              expect(
                floor!.rooms![0]!.roomFloor,
                isNotEmpty,
              );

              expect(
                floor!.rooms![0]!.roomFloor,
                roomFloor,
              );
            },
          );

          test(
            'roomCenter',
            () {
              expect(
                floor!.rooms![0]!.roomCenter,
                isA<TrentCenters>(),
              );

              expect(
                floor!.rooms![0]!.roomCenter,
                isNotNull,
              );

              expect(
                floor!.rooms![0]!.roomCenter,
                floorCenter,
              );
            },
          );

          test(
            'roomType',
            () {
              expect(
                floor!.rooms![0]!.roomType,
                isA<String>(),
              );

              expect(
                floor!.rooms![0]!.roomType,
                isNotNull,
              );

              expect(
                floor!.rooms![0]!.roomType,
                isNotEmpty,
              );

              expect(
                floor!.rooms![0]!.roomType,
                roomType,
              );
            },
          );

          test(
            'roomCapacity',
            () {
              expect(
                floor!.rooms![0]!.roomCapacity,
                isA<String>(),
              );

              expect(
                floor!.rooms![0]!.roomCapacity,
                isNotNull,
              );

              expect(
                floor!.rooms![0]!.roomCapacity,
                isNotEmpty,
              );

              expect(
                floor!.rooms![0]!.roomCapacity,
                roomCapacity,
              );
            },
          );

          test(
            'centerCode',
            () {
              expect(
                floor!.rooms![0]!.centerCode,
                isA<String>(),
              );

              expect(
                floor!.rooms![0]!.centerCode,
                isNotNull,
              );

              expect(
                floor!.rooms![0]!.centerCode,
                isNotEmpty,
              );

              expect(
                floor!.rooms![0]!.centerCode,
                centerCode,
              );
            },
          );

          test(
            'reviewImageAssetPath',
            () {
              expect(
                floor!.rooms![0]!.reviewImageAssetPath,
                isA<String>(),
              );

              expect(
                floor!.rooms![0]!.reviewImageAssetPath,
                isNotNull,
              );

              expect(
                floor!.rooms![0]!.reviewImageAssetPath,
                isNotEmpty,
              );

              expect(
                floor!.rooms![0]!.reviewImageAssetPath,
                reviewImageAssetPath,
              );
            },
          );

          test(
            'hDImageAssetPath',
            () {
              expect(
                floor!.rooms![0]!.hDImageAssetPath,
                isA<String>(),
              );

              expect(
                floor!.rooms![0]!.hDImageAssetPath,
                isNotNull,
              );

              expect(
                floor!.rooms![0]!.hDImageAssetPath,
                isNotEmpty,
              );

              expect(
                floor!.rooms![0]!.hDImageAssetPath,
                hDImageAssetPath,
              );
            },
          );

          test(
            'fHDImageAssetPath',
            () {
              expect(
                floor!.rooms![0]!.fHDImageAssetPath,
                isA<String>(),
              );

              expect(
                floor!.rooms![0]!.fHDImageAssetPath,
                isNotNull,
              );

              expect(
                floor!.rooms![0]!.fHDImageAssetPath,
                isNotEmpty,
              );

              expect(
                floor!.rooms![0]!.fHDImageAssetPath,
                fHDImageAssetPath,
              );
            },
          );
        },
      );
    },
  );
}
