import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:math';

import 'package:trent_u_class_find/models/enums/enums.dart';
import 'package:trent_u_class_find/models/center/center.dart';
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
    'TrentCenter',
    () {
      TrentCenterModel? center;
      TrentFloorModel? floor;
      TrentRoomModel? room;

      String? roomNumber;
      String? roomFloor;
      String? roomType;
      String? roomCapacity;
      String? roomReviewImageAssetPath;
      String? roomHDImageAssetPath;
      String? roomFHDImageAssetPath;

      String? floorNumber;
      String? floorName;

      String? trentCenterName;
      String? trentCenterCode;

      TrentCenters? trentCenter;

      String? centerReviewImageAssetPath;
      String? centerHDImageAssetPath;

      String? otherTrentCenterCodeOne;
      String? otherTrentCenterCodeTwo;
      String? otherTrentCenterCodeThree;
      String? otherTrentCenterCodeFour;
      String? otherTrentCenterCodeFive;
      List<String?>? otherTrentCenterCodes;

      List<TrentFloorModel?>? floors;

      List<TrentRoomModel?>? rooms;

      ExpansionTileController? expansionTileController;
      ExpansionTileController? floorExpansionTileController;

      setUp(
        () {
          roomNumber = generateRandomString();
          roomFloor = generateRandomString();
          roomType = generateRandomString();
          roomCapacity = generateRandomString();
          roomReviewImageAssetPath = generateRandomString();
          roomHDImageAssetPath = generateRandomString();
          roomFHDImageAssetPath = generateRandomString();

          floorNumber = generateRandomString();
          floorName = generateRandomString();

          trentCenterName = generateRandomString();
          trentCenterCode = generateRandomString();

          trentCenter = generateRandomTrentCenter();

          centerReviewImageAssetPath = generateRandomString();
          centerHDImageAssetPath = generateRandomString();

          otherTrentCenterCodeOne = generateRandomString();
          otherTrentCenterCodeTwo = generateRandomString();
          otherTrentCenterCodeThree = generateRandomString();
          otherTrentCenterCodeFour = generateRandomString();
          otherTrentCenterCodeFive = generateRandomString();
          otherTrentCenterCodes = <String?>[
            otherTrentCenterCodeOne,
            otherTrentCenterCodeTwo,
            otherTrentCenterCodeThree,
            otherTrentCenterCodeFour,
            otherTrentCenterCodeFive,
          ];

          expansionTileController = ExpansionTileController();
          floorExpansionTileController = ExpansionTileController();

          room = TrentRoomModel(
            roomNumber: roomNumber,
            roomFloor: roomFloor,
            roomCenter: trentCenter,
            roomType: roomType,
            roomCapacity: roomCapacity,
            centerCode: Random().nextBool()
                ? trentCenterCode
                : otherTrentCenterCodes![Random().nextInt(
                    otherTrentCenterCodes!.length,
                  )],
            reviewImageAssetPath: roomReviewImageAssetPath,
            hDImageAssetPath: roomHDImageAssetPath,
            fHDImageAssetPath: roomFHDImageAssetPath,
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
            floorCenter: trentCenter,
            rooms: rooms,
            expansionTileController: floorExpansionTileController,
          );

          floors = <TrentFloorModel?>[
            floor,
          ];

          center = TrentCenterModel(
            trentCenterName: trentCenterName,
            trentCenterCode: trentCenterCode,
            trentCenter: trentCenter,
            otherTrentCenterCodes: otherTrentCenterCodes,
            reviewImageAssetPath: centerReviewImageAssetPath,
            hDImageAssetPath: centerHDImageAssetPath,
            trentCenterFloors: floors,
            expansionTileController: expansionTileController,
          );
        },
      );

      test(
        'trentCenterName',
        () {
          expect(
            center!.trentCenterName,
            isA<String>(),
          );

          expect(
            center!.trentCenterName,
            isNotNull,
          );

          expect(
            center!.trentCenterName,
            isNotEmpty,
          );

          expect(
            center!.trentCenterName,
            trentCenterName,
          );
        },
      );

      test(
        'trentCenterCode',
        () {
          expect(
            center!.trentCenterCode,
            isA<String>(),
          );

          expect(
            center!.trentCenterCode,
            isNotNull,
          );

          expect(
            center!.trentCenterCode,
            isNotEmpty,
          );

          expect(
            center!.trentCenterCode,
            trentCenterCode,
          );
        },
      );

      test(
        'reviewImageAssetPath',
        () {
          expect(
            center!.reviewImageAssetPath,
            isA<String>(),
          );

          expect(
            center!.reviewImageAssetPath,
            isNotNull,
          );

          expect(
            center!.reviewImageAssetPath,
            isNotEmpty,
          );

          expect(
            center!.reviewImageAssetPath,
            centerReviewImageAssetPath,
          );
        },
      );

      test(
        'hDImageAssetPath',
        () {
          expect(
            center!.hDImageAssetPath,
            isA<String>(),
          );

          expect(
            center!.hDImageAssetPath,
            isNotNull,
          );

          expect(
            center!.hDImageAssetPath,
            isNotEmpty,
          );

          expect(
            center!.hDImageAssetPath,
            centerHDImageAssetPath,
          );
        },
      );

      test(
        'trentCenter',
        () {
          expect(
            center!.trentCenter,
            isA<TrentCenters>(),
          );

          expect(
            center!.trentCenter,
            isNotNull,
          );

          expect(
            center!.trentCenter,
            trentCenter,
          );
        },
      );

      test(
        'otherTrentCenterCodes',
        () {
          expect(
            center!.otherTrentCenterCodes,
            isA<List<String?>?>(),
          );

          expect(
            center!.otherTrentCenterCodes,
            isNotNull,
          );

          expect(
            center!.otherTrentCenterCodes,
            isNotEmpty,
          );

          expect(
            center!.otherTrentCenterCodes,
            otherTrentCenterCodes,
          );
        },
      );

      test(
        'expansionTileController',
        () {
          expect(
            center!.expansionTileController,
            isA<ExpansionTileController>(),
          );

          expect(
            center!.expansionTileController,
            isNotNull,
          );

          expect(
            center!.expansionTileController,
            expansionTileController,
          );
        },
      );

      test(
        'trentCenterFloors',
        () {
          expect(
            center!.trentCenterFloors,
            isA<List<TrentFloorModel?>?>(),
          );

          expect(
            center!.trentCenterFloors,
            isNotNull,
          );

          expect(
            center!.trentCenterFloors,
            isNotEmpty,
          );

          expect(
            center!.trentCenterFloors,
            floors,
          );
        },
      );

      group(
        'Floor',
        () {
          test(
            'floorNumber',
            () {
              expect(
                center!.trentCenterFloors![0]!.floorNumber,
                isA<String>(),
              );

              expect(
                center!.trentCenterFloors![0]!.floorNumber,
                isNotNull,
              );

              expect(
                center!.trentCenterFloors![0]!.floorNumber,
                isNotEmpty,
              );

              expect(
                center!.trentCenterFloors![0]!.floorNumber,
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
                center!.trentCenterFloors![0]!.floorName,
                isA<String>(),
              );

              expect(
                center!.trentCenterFloors![0]!.floorName,
                isNotNull,
              );

              expect(
                center!.trentCenterFloors![0]!.floorName,
                isNotEmpty,
              );

              expect(
                center!.trentCenterFloors![0]!.floorName,
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
                center!.trentCenterFloors![0]!.floorCenter,
                isA<TrentCenters>(),
              );

              expect(
                center!.trentCenterFloors![0]!.floorCenter,
                isNotNull,
              );

              expect(
                center!.trentCenterFloors![0]!.floorCenter,
                equals(
                  trentCenter,
                ),
              );
            },
          );

          test(
            'floorExpansionTileController',
            () {
              expect(
                center!.trentCenterFloors![0]!.expansionTileController,
                isA<ExpansionTileController>(),
              );

              expect(
                center!.trentCenterFloors![0]!.expansionTileController,
                isNotNull,
              );

              expect(
                center!.trentCenterFloors![0]!.expansionTileController,
                equals(
                  floorExpansionTileController,
                ),
              );
            },
          );

          test(
            'rooms',
            () {
              expect(
                center!.trentCenterFloors![0]!.rooms,
                isA<List<TrentRoomModel?>?>(),
              );

              expect(
                center!.trentCenterFloors![0]!.rooms,
                isNotNull,
              );

              expect(
                center!.trentCenterFloors![0]!.rooms,
                isNotEmpty,
              );

              expect(
                center!.trentCenterFloors![0]!.rooms,
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
                    center!.trentCenterFloors![0]!.rooms![0]!.roomNumber,
                    isA<String>(),
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.roomNumber,
                    isNotNull,
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.roomNumber,
                    isNotEmpty,
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.roomNumber,
                    roomNumber,
                  );
                },
              );

              test(
                'roomFloor',
                () {
                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.roomFloor,
                    isA<String>(),
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.roomFloor,
                    isNotNull,
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.roomFloor,
                    isNotEmpty,
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.roomFloor,
                    roomFloor,
                  );
                },
              );

              test(
                'roomCenter',
                () {
                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.roomCenter,
                    isA<TrentCenters>(),
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.roomCenter,
                    isNotNull,
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.roomCenter,
                    trentCenter,
                  );
                },
              );

              test(
                'roomType',
                () {
                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.roomType,
                    isA<String>(),
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.roomType,
                    isNotNull,
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.roomType,
                    isNotEmpty,
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.roomType,
                    roomType,
                  );
                },
              );

              test(
                'roomCapacity',
                () {
                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.roomCapacity,
                    isA<String>(),
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.roomCapacity,
                    isNotNull,
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.roomCapacity,
                    isNotEmpty,
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.roomCapacity,
                    roomCapacity,
                  );
                },
              );

              test(
                'centerCode',
                () {
                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.centerCode,
                    isA<String>(),
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.centerCode,
                    isNotNull,
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.centerCode,
                    isNotEmpty,
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.centerCode ==
                            trentCenterCode ||
                        otherTrentCenterCodes!.contains(
                          center!.trentCenterFloors![0]!.rooms![0]!.centerCode,
                        ),
                    true,
                  );
                },
              );

              test(
                'reviewImageAssetPath',
                () {
                  expect(
                    center!
                        .trentCenterFloors![0]!.rooms![0]!.reviewImageAssetPath,
                    isA<String>(),
                  );

                  expect(
                    center!
                        .trentCenterFloors![0]!.rooms![0]!.reviewImageAssetPath,
                    isNotNull,
                  );

                  expect(
                    center!
                        .trentCenterFloors![0]!.rooms![0]!.reviewImageAssetPath,
                    isNotEmpty,
                  );

                  expect(
                    center!
                        .trentCenterFloors![0]!.rooms![0]!.reviewImageAssetPath,
                    roomReviewImageAssetPath,
                  );
                },
              );

              test(
                'hDImageAssetPath',
                () {
                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.hDImageAssetPath,
                    isA<String>(),
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.hDImageAssetPath,
                    isNotNull,
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.hDImageAssetPath,
                    isNotEmpty,
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.hDImageAssetPath,
                    roomHDImageAssetPath,
                  );
                },
              );

              test(
                'fHDImageAssetPath',
                () {
                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.fHDImageAssetPath,
                    isA<String>(),
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.fHDImageAssetPath,
                    isNotNull,
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.fHDImageAssetPath,
                    isNotEmpty,
                  );

                  expect(
                    center!.trentCenterFloors![0]!.rooms![0]!.fHDImageAssetPath,
                    roomFHDImageAssetPath,
                  );
                },
              );
            },
          );
        },
      );
    },
  );
}
