import 'package:flutter/material.dart';
import 'package:trent_u_class_find/models/center/center.dart';
import 'package:trent_u_class_find/models/enums/enums.dart';
import 'package:trent_u_class_find/models/floor/floor.dart';
import 'package:trent_u_class_find/models/room/room.dart';
import 'package:trent_u_class_find/models/step/step.dart';
import 'package:trent_u_class_find/models/steps/steps.dart';

import 'package:trent_u_class_find/services/theme_mode_notifier_service/theme_mode_notifier_service.dart';

ThemeMode? appThemeMode = ThemeMode.system;

TargetPlatform? appTargetPlatform = TargetPlatform.android;

int? appThemeSettingsInt = 2;
int? appImageQualityViewSettingsInt = 1;
int? appImageQualityDownloadSettingsInt = 1;

ThemeModeNotifierService? globalThemeModeNotifier;

FocusNode? quickSearchFocusNode;

GlobalKey<FormState>? quickSearchFormKey;

late AnimationController? campusLinksMenuAnimationController;
ScrollController? buildingsPageScrollController;
TextEditingController? quickSearchController;

ExpansionTileController? campusLinksMenuController;

late Animation<double>? campusLinksMenuAnimationProgress;

List<TrentCenterModel?> trentCentersDB = <TrentCenterModel?>[
  TrentCenterModel(
    trentCenterName: 'Bata Library',
    trentCenterCode: 'BL',
    trentCenter: TrentCenters.bataLibrary,
    reviewImageAssetPath: 'assets/images/review/BL_Center.jpg',
    hDImageAssetPath: 'assets/images/720/BL_Center.jpg',
    expansionTileController: ExpansionTileController(),
    trentCenterFloors: <TrentFloorModel?>[
      TrentFloorModel(
        floorNumber: '1',
        floorName: '1st Floor',
        floorCenter: TrentCenters.bataLibrary,
        expansionTileController: ExpansionTileController(),
        rooms: const <TrentRoomModel?>[
          TrentRoomModel(
            roomNumber: '102',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata1.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata1.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you are leaving the bridge stay to the left and walk down the steps.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'Walk straight and take a right turn down the steps up ahead.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata4.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata4.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Walk down the steps towards the library doors below on your left.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata5.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata5.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Enter the library and take a left turn down the hallway up ahead.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata6.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata6.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Walk straight down the hallway towards the doors up ahead. Your room will be the first room straight ahead as you enter the hallway.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata7.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Bata Library - Language Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata102.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata102.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata102.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.bataLibrary,
            roomType: 'Language Lab',
            roomCapacity: '26',
            centerCode: 'BL',
            reviewImageAssetPath: 'assets/images/review/bata102.jpg',
            hDImageAssetPath: 'assets/images/720/bata102.jpg',
            fHDImageAssetPath: 'assets/images/1080/bata102.jpg',
          ),
          TrentRoomModel(
            roomNumber: '103',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata1.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata1.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you are leaving the bridge stay to the left and walk down the steps.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'Walk straight and take a right turn down the steps up ahead.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata4.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata4.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Walk down the steps towards the library doors below on your left.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata5.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata5.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Enter the library and take a left turn down the hallway up ahead.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata6.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata6.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Walk straight down the hallway towards the doors up ahead and enter the hallway.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata7.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk straight down the hallway on the right. Your room will be at the end of the hallway on your right.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata9.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata9.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata9.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Bata Library - Film Theatre',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata103.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata103.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata103.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.bataLibrary,
            roomType: 'Film Theater',
            roomCapacity: '64',
            centerCode: 'BL',
            reviewImageAssetPath: 'assets/images/review/bata103.jpg',
            hDImageAssetPath: 'assets/images/720/bata103.jpg',
            fHDImageAssetPath: 'assets/images/1080/bata103.jpg',
          ),
          TrentRoomModel(
            roomNumber: '107.1',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank and towards the overhead walkway up on your left.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'Walk straight down the overhead walkway towards the library doors. Enter the library.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata10.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'On entering the hallway take a left turn down the steps up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata11.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata11.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Walk straight ahead towards the library doors up on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata12.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata12.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata12.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Walk straight towards the entrance doors and enter the library.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata13.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata13.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'On entering the library walk straight to your left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata43.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata43.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata43.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk towards the staircase and take a right turn downstairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata42.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata42.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata42.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Walk downstairs to the 1st floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata41.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata41.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata41.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription: 'Enter the 1st floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata40.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata40.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata40.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'On your right walk straight and take a right turn up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata39.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata39.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata39.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription:
                      'Walk straight towards the set of hallway doors and enter the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata38.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata38.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription: 'Take a left turn up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata37.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata37.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata37.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription:
                      'Walk straight, your room will be up on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata36.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata36.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata36.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '14',
                  stepDescription: 'Bata Library - Seminar Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata107.1.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata107.1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bata107.1.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.bataLibrary,
            roomType: 'Seminar Room',
            roomCapacity: '20',
            centerCode: 'BL',
            reviewImageAssetPath: 'assets/images/review/bata107.1.jpg',
            hDImageAssetPath: 'assets/images/720/bata107.1.jpg',
            fHDImageAssetPath: 'assets/images/1080/bata107.1.jpg',
          ),
          TrentRoomModel(
            roomNumber: '107.2',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank and towards the overhead walkway up on your left.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'Walk straight down the overhead walkway towards the library doors. Enter the library.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata10.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'On entering the hallway take a left turn down the steps up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata11.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata11.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Walk straight ahead towards the library doors up on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata12.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata12.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata12.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Walk straight towards the entrance doors and enter the library.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata13.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata13.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'On entering the library walk straight to your left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata43.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata43.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata43.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk towards the staircase and take a right turn downstairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata42.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata42.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata42.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Walk downstairs to the 1st floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata41.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata41.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata41.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription: 'Enter the 1st floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata40.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata40.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata40.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'On your right walk straight and take a right turn up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata39.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata39.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata39.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription:
                      'Walk straight towards the set of hallway doors and enter the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata38.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata38.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription: 'Take a left turn up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata37.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata37.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata37.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Walk straight towards your room up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata35.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata35.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata35.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '14',
                  stepDescription: 'Bata Library - Smith Conference Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata107.2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata107.2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bata107.2.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.bataLibrary,
            roomType: 'Seminar Room',
            roomCapacity: '20',
            centerCode: 'BL',
            reviewImageAssetPath: 'assets/images/review/bata107.2.jpg',
            hDImageAssetPath: 'assets/images/720/bata107.2.jpg',
            fHDImageAssetPath: 'assets/images/1080/bata107.2.jpg',
          ),
        ],
      ),
      TrentFloorModel(
        floorNumber: '2',
        floorName: '2nd Floor',
        floorCenter: TrentCenters.bataLibrary,
        expansionTileController: ExpansionTileController(),
        rooms: const <TrentRoomModel?>[
          TrentRoomModel(
            roomNumber: '201',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank and towards the overhead walkway up on your left.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'Walk straight down the overhead walkway towards the library doors. Enter the library.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata10.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'On entering the hallway take a left turn down the steps up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata11.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata11.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Walk straight ahead towards the library doors up on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata12.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata12.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata12.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Walk straight towards the entrance doors and enter the library.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata13.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata13.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'On entering the library walk straight and take a left turn around the wall.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata14.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata14.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata14.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Walk straight towards your room up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata18.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata18.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Bata Library - Computer Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata201.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata201.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata201.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.bataLibrary,
            roomType: 'Computer Lab',
            roomCapacity: '9',
            centerCode: 'BL',
            reviewImageAssetPath: 'assets/images/review/bata201.jpg',
            hDImageAssetPath: 'assets/images/720/bata201.jpg',
            fHDImageAssetPath: 'assets/images/1080/bata201.jpg',
          ),
          TrentRoomModel(
            roomNumber: '210',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank and towards the overhead walkway up on your left.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'Walk straight down the overhead walkway towards the library doors. Enter the library.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata10.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'On entering the hallway take a left turn down the steps up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata11.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata11.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Walk straight ahead towards the library doors up on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata12.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata12.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata12.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Walk straight towards the entrance doors and enter the library.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata13.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata13.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'On entering the library take a right turn around the reception desk.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata15.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata15.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata15.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk straight and take a right turn up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata16.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata16.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata16.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Walk straight towards your room up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata17.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata17.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata17.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription: 'Bata Library - Computer Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata210.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata210.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata210.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.bataLibrary,
            roomType: 'Computer Lab',
            roomCapacity: '20',
            centerCode: 'BL',
            reviewImageAssetPath: 'assets/images/review/bata210.jpg',
            hDImageAssetPath: 'assets/images/720/bata210.jpg',
            fHDImageAssetPath: 'assets/images/1080/bata210.jpg',
          ),
        ],
      ),
      TrentFloorModel(
        floorNumber: '3',
        floorName: '3rd Floor',
        floorCenter: TrentCenters.bataLibrary,
        expansionTileController: ExpansionTileController(),
        rooms: const <TrentRoomModel?>[
          TrentRoomModel(
            roomNumber: '314',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank and towards the overhead walkway up on your left.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'Walk straight down the overhead walkway towards the library doors. Enter the library.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata10.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'On entering the hallway take a left turn down the steps up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata11.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata11.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Walk straight ahead towards the library doors up on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata12.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata12.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata12.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Walk straight towards the entrance doors and enter the library.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata13.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata13.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'On entering the library walk straight towards the staircase up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata19.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata19.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Continue walking towards the staircase a take a left turn up the staircase.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata20.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata20.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata20.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk up the staircase towards the 3rd floor door up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata21.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata21.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata21.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription: 'Enter the 3rd floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata22.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata22.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata22.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'On your left, walk straight and take a right turn down the stacks.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata25.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata25.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata25.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Walk straight towards your room up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata26.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata26.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata26.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription: 'Bata Library - Seminar Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata314.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata314.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata314.jpg',
                ),
              ],
            ),
            roomFloor: '3rd Floor',
            roomCenter: TrentCenters.bataLibrary,
            roomType: 'Seminar Room',
            roomCapacity: '20',
            centerCode: 'BL',
            reviewImageAssetPath: 'assets/images/review/bata314.jpg',
            hDImageAssetPath: 'assets/images/720/bata314.jpg',
            fHDImageAssetPath: 'assets/images/1080/bata314.jpg',
          ),
        ],
      ),
      TrentFloorModel(
        floorNumber: '4',
        floorName: '4th Floor',
        floorCenter: TrentCenters.bataLibrary,
        expansionTileController: ExpansionTileController(),
        rooms: const <TrentRoomModel?>[
          TrentRoomModel(
            roomNumber: '401',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank and towards the overhead walkway up on your left.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'Walk straight down the overhead walkway towards the library doors. Enter the library.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata10.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'On entering the hallway take a left turn down the steps up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata11.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata11.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Walk straight ahead towards the library doors up on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata12.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata12.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata12.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Walk straight towards the entrance doors and enter the library.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata13.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata13.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'On entering the library walk straight towards the staircase up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata19.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata19.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Continue walking towards the staircase a take a left turn up the staircase.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata20.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata20.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata20.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Walk up the steps to the 4th floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata23.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata23.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata23.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Continue walking upstairs to the 4th floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata24.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata24.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata24.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'Walk straight to the 4th floor door on the right and enter the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata27.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata27.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata27.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription:
                      'On entering the hallway take a right turn and walk straight ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata28.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata28.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata28.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Continue walking straight and take a right turn at the end of the stacks.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata29.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata29.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata29.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription:
                      'Walk straight towards your room up on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata30.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata30.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata30.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '14',
                  stepDescription: 'Bata Library - Seminar Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata401.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata401.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata401.jpg',
                ),
              ],
            ),
            roomFloor: '4th Floor',
            roomCenter: TrentCenters.bataLibrary,
            roomType: 'Seminar Room',
            roomCapacity: '30',
            centerCode: 'BL',
            reviewImageAssetPath: 'assets/images/review/bata401.jpg',
            hDImageAssetPath: 'assets/images/720/bata401.jpg',
            fHDImageAssetPath: 'assets/images/1080/bata401.jpg',
          ),
          TrentRoomModel(
            roomNumber: '402',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank and towards the overhead walkway up on your left.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'Walk straight down the overhead walkway towards the library doors. Enter the library.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata10.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'On entering the hallway take a left turn down the steps up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata11.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata11.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Walk straight ahead towards the library doors up on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata12.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata12.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata12.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Walk straight towards the entrance doors and enter the library.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata13.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata13.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'On entering the library walk straight towards the staircase up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata19.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata19.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Continue walking towards the staircase a take a left turn up the staircase.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata20.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata20.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata20.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Walk up the steps to the 4th floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata23.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata23.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata23.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Continue walking upstairs to the 4th floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata24.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata24.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata24.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'Walk straight to the 4th floor door on the right and enter the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata27.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata27.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata27.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription:
                      'On entering the hallway take a right turn and walk straight ahead. Take a right turn around the corner.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata31.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata31.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata31.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription: 'Walk straight ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata32.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata32.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata32.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription:
                      'Continue walking straight and take a right turn at the end of the stacks.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata33.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata33.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata33.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '14',
                  stepDescription:
                      'Walk straight towards your room on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata34.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata34.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata34.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '15',
                  stepDescription: 'Bata Library - Seminar Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata402.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata402.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata402.jpg',
                ),
              ],
            ),
            roomFloor: '4th Floor',
            roomCenter: TrentCenters.bataLibrary,
            roomType: 'Seminar Room',
            roomCapacity: '25',
            centerCode: 'BL',
            reviewImageAssetPath: 'assets/images/review/bata402.jpg',
            hDImageAssetPath: 'assets/images/720/bata402.jpg',
            fHDImageAssetPath: 'assets/images/1080/bata402.jpg',
          ),
        ],
      ),
    ],
  ),
  TrentCenterModel(
    trentCenterName: 'Champlain College',
    trentCenterCode: 'CCN',
    otherTrentCenterCodes: <String?>[
      'CCS',
      'CCW',
    ],
    trentCenter: TrentCenters.champlainCollege,
    reviewImageAssetPath: 'assets/images/review/CC_Center.jpg',
    hDImageAssetPath: 'assets/images/720/CC_Center.jpg',
    expansionTileController: ExpansionTileController(),
    trentCenterFloors: <TrentFloorModel?>[
      TrentFloorModel(
        floorNumber: '1',
        floorName: 'All Floors',
        floorCenter: TrentCenters.champlainCollege,
        expansionTileController: ExpansionTileController(),
        rooms: const <TrentRoomModel?>[
          TrentRoomModel(
            roomNumber: 'Bike',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you are leaving the bridge stay to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge.jpg',
                  stepHDImageAssetPath: 'assets/images/find/small/bridge.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/small/bridge.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'Take a right up ahead between the two Champlain buildings.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetochamplain.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetochamplain.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetochamplain.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Go straight ahead, down the steps.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain17.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain17.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain17.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Keep walking straight and then take a left turn up ahead at the pillars.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bike1.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bike1.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bike1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Walk through the pillars and stay to the left.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bike2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bike2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bike2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk straight and take right turn at the parking lot.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bike3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bike3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bike3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk straight and take a right turn at the garage up ahead.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bike4.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bike4.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bike4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription: 'Bike Storage - Champlain College',
                  stepSmallImageAssetPath: 'assets/images/find/small/bike5.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bike5.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bike5.jpg',
                ),
              ],
            ),
            roomFloor: 'All Floors',
            roomCenter: TrentCenters.champlainCollege,
            roomType: 'Outdoor',
            roomCapacity: 'N/A',
            centerCode: 'N/A',
            reviewImageAssetPath: 'assets/images/review/bike5.jpg',
            hDImageAssetPath: 'assets/images/720/bike5.jpg',
            fHDImageAssetPath: 'assets/images/1080/bike5.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'G4',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you are leaving the bridge stay to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'Take a right up ahead between the two Champlain buildings.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetochamplain.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetochamplain.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetochamplain.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Go straight ahead, down the steps.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain17.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain17.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain17.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Keep walking straight and then take a right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain5.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/champlain5.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Walk down the pathway to the corridor ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain1.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/champlain1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk throught the corridor and take a right at the first entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/champlain7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Open the door and you will see your room on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain8.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/champlain8.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain8.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription: 'Champlain College - Seminar Room',
                  stepSmallImageAssetPath: 'assets/images/find/small/CCNG4.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/CCNG4.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/CCNG4.jpg',
                ),
              ],
            ),
            roomFloor: 'All Floors',
            roomCenter: TrentCenters.champlainCollege,
            roomType: 'Seminar Room',
            roomCapacity: '20',
            centerCode: 'CCN',
            reviewImageAssetPath: 'assets/images/review/CCNG4.jpg',
            hDImageAssetPath: 'assets/images/720/CCNG4.jpg',
            fHDImageAssetPath: 'assets/images/1080/CCNG4.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'I1',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you are leaving the bridge stay to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'Take a right up ahead between the two Champlain buildings.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetochamplain.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetochamplain.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetochamplain.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Go straight ahead, down the steps.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain17.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain17.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain17.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Keep heading straight towards the corridor up ahead',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain4.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/champlain4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Continue walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/champlain2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'On entering the corridor take a left at the first entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain13.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Open the door, the room will be on your left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain32.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain32.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain32.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription: 'Champlain College - Seminar Room',
                  stepSmallImageAssetPath: 'assets/images/find/small/CCNI1.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/CCNI1.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/CCNI1.jpg',
                ),
              ],
            ),
            roomFloor: 'All Floors',
            roomCenter: TrentCenters.champlainCollege,
            roomType: 'Seminar Room',
            roomCapacity: '20',
            centerCode: 'CCN',
            reviewImageAssetPath: 'assets/images/review/CCNI1.jpg',
            hDImageAssetPath: 'assets/images/720/CCNI1.jpg',
            fHDImageAssetPath: 'assets/images/1080/CCNI1.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'I2',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you are leaving the bridge stay to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'Take a right up ahead between the two Champlain buildings.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetochamplain.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetochamplain.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetochamplain.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Go straight ahead, down the steps.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain17.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain17.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain17.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Keep heading straight towards the corridor up ahead',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain4.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/champlain4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Continue walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/champlain2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'On entering the corridor take a left at the first entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain13.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Open the door, the room will be straight ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain32.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain32.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain32.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription: 'Champlain College - Seminar Room',
                  stepSmallImageAssetPath: 'assets/images/find/small/CCNI2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/CCNI2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/CCNI2.jpg',
                ),
              ],
            ),
            roomFloor: 'All Floors',
            roomCenter: TrentCenters.champlainCollege,
            roomType: 'Seminar Room',
            roomCapacity: '14',
            centerCode: 'CCN',
            reviewImageAssetPath: 'assets/images/review/CCNI2.jpg',
            hDImageAssetPath: 'assets/images/720/CCNI2.jpg',
            fHDImageAssetPath: 'assets/images/1080/CCNI2.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'K1',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you are leaving the bridge stay to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'Take a right up ahead between the two Champlain buildings.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetochamplain.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetochamplain.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetochamplain.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Go straight ahead, down the steps.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain17.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain17.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain17.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Keep heading straight towards the corridor up ahead',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain4.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/champlain4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Walk straight through the corridor and out the back.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain12.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain12.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain12.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Take a right turn as you exit the corridor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Walk down this pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain34.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain34.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain34.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription: 'Head through the corridor entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain36.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain36.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain36.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'Take a left at the first entrance, your room will be up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain23.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain23.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain23.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Champlain College - Seminar Room',
                  stepSmallImageAssetPath: 'assets/images/find/small/CCNK1.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/CCNK1.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/CCNK1.jpg',
                ),
              ],
            ),
            roomFloor: 'All Floors',
            roomCenter: TrentCenters.champlainCollege,
            roomType: 'Seminar Room',
            roomCapacity: '20',
            centerCode: 'CCN',
            reviewImageAssetPath: 'assets/images/review/CCNK1.jpg',
            hDImageAssetPath: 'assets/images/720/CCNK1.jpg',
            fHDImageAssetPath: 'assets/images/1080/CCNK1.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'M2',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you are leaving the bridge stay to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'Take a right up ahead between the two Champlain buildings.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetochamplain.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetochamplain.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetochamplain.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Go straight ahead, down the steps.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain17.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain17.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain17.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Keep heading straight towards the corridor up ahead',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain4.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/champlain4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Walk straight throught the corridor and out the back.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain12.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain12.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain12.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Take a left turn as you exit the corridor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain11.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain11.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk down the pathway and open the door on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain14.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain14.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain14.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription: 'Champlain College - Council Chamber',
                  stepSmallImageAssetPath: 'assets/images/find/small/CCNM2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/CCNM2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/CCNM2.jpg',
                ),
              ],
            ),
            roomFloor: 'All Floors',
            roomCenter: TrentCenters.champlainCollege,
            roomType: 'Council Chamber',
            roomCapacity: '60',
            centerCode: 'CCN',
            reviewImageAssetPath: 'assets/images/review/CCNM2.jpg',
            hDImageAssetPath: 'assets/images/720/CCNM2.jpg',
            fHDImageAssetPath: 'assets/images/1080/CCNM2.jpg',
          ),
          TrentRoomModel(
            roomNumber: '307',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you are leaving the bridge stay to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'Take a right up ahead between the two Champlain buildings.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetochamplain.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetochamplain.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetochamplain.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Go straight ahead through those doors, your classroom will be on the left',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain18.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain18.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Champlain College - Lecture Hall',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/CCS307.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/CCS307.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/CCS307.jpg',
                ),
              ],
            ),
            roomFloor: 'All Floors',
            roomCenter: TrentCenters.champlainCollege,
            roomType: 'Lecture Hall',
            roomCapacity: '140',
            centerCode: 'CCS',
            reviewImageAssetPath: 'assets/images/review/CCS307.jpg',
            hDImageAssetPath: 'assets/images/720/CCS307.jpg',
            fHDImageAssetPath: 'assets/images/1080/CCS307.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'A1',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you are leaving the bridge stay to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'Take a right up ahead between the two Champlain buildings.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetochamplain.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetochamplain.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetochamplain.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Go straight ahead, down the steps.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain17.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain17.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain17.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'As you reach the bottom of the steps, take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain20.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain20.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain20.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Walk straight ahead through the corridor entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain21.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain21.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain21.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'You will see this entrance on your first left. Your room is through this door.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain38.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain38.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Champlain College - Seminar Room',
                  stepSmallImageAssetPath: 'assets/images/find/small/CCWA1.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/CCWA1.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/CCWA1.jpg',
                ),
              ],
            ),
            roomFloor: 'All Floors',
            roomCenter: TrentCenters.champlainCollege,
            roomType: 'Seminar Room',
            roomCapacity: '20',
            centerCode: 'CCW',
            reviewImageAssetPath: 'assets/images/review/CCWA1.jpg',
            hDImageAssetPath: 'assets/images/720/CCWA1.jpg',
            fHDImageAssetPath: 'assets/images/1080/CCWA1.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'A2',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you are leaving the bridge stay to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'Take a right up ahead between the two Champlain buildings.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetochamplain.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetochamplain.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetochamplain.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Go straight ahead, down the steps.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain17.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain17.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain17.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'As you reach the bottom of the steps, take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain20.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain20.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain20.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Walk straight ahead through the corridor entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain21.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain21.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain21.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'You will see this entrance on your first left. Your room is through this door.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain38.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain38.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Champlain College - Seminar Room',
                  stepSmallImageAssetPath: 'assets/images/find/small/CCWA2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/CCWA2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/CCWA2.jpg',
                ),
              ],
            ),
            roomFloor: 'All Floors',
            roomCenter: TrentCenters.champlainCollege,
            roomType: 'Seminar Room',
            roomCapacity: '35',
            centerCode: 'CCW',
            reviewImageAssetPath: 'assets/images/review/CCWA2.jpg',
            hDImageAssetPath: 'assets/images/720/CCWA2.jpg',
            fHDImageAssetPath: 'assets/images/1080/CCWA2.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'C3',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you are leaving the bridge stay to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'Take a right up ahead between the two Champlain buildings.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetochamplain.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetochamplain.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetochamplain.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Go straight ahead, down the steps.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain17.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain17.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain17.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Walk down the pathway and take a left turn at the path up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain6.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/champlain6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Walk straight through the entrance up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain15.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain15.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain15.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'On the right you will see another entrance that leads to your classroom.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain16.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain16.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain16.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Champlain College - Seminar Room',
                  stepSmallImageAssetPath: 'assets/images/find/small/CCWC3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/CCWC3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/CCWC3.jpg',
                ),
              ],
            ),
            roomFloor: 'All Floors',
            roomCenter: TrentCenters.champlainCollege,
            roomType: 'Seminar Room',
            roomCapacity: '20',
            centerCode: 'CCW',
            reviewImageAssetPath: 'assets/images/review/CCWC3.jpg',
            hDImageAssetPath: 'assets/images/720/CCWC3.jpg',
            fHDImageAssetPath: 'assets/images/1080/CCWC3.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'The Seasoned Spoon Café',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you are leaving the bridge stay to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'Take a right turn up ahead between the two Champlain buildings.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetochamplain.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetochamplain.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetochamplain.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Go straight ahead, down the steps.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/champlain17.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/champlain17.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/champlain17.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'At the bottom of the staircase take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/seasonedspoon1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/seasonedspoon1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/seasonedspoon1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Walk straight towards the entrance of Champlain College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/seasonedspoon2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/seasonedspoon2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/seasonedspoon2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Enter the building. You are at the Seasoned Spoon!',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/seasonedspoon3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/seasonedspoon3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/seasonedspoon3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Seasoned Spoon',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/seasonedspoon4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/seasonedspoon4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/seasonedspoon4.jpg',
                ),
              ],
            ),
            roomFloor: 'All Floors',
            roomCenter: TrentCenters.champlainCollege,
            roomType: 'Café',
            roomCapacity: 'N/A',
            centerCode: 'N/A',
            reviewImageAssetPath: 'assets/images/review/seasonedspoon4.jpg',
            hDImageAssetPath: 'assets/images/720/seasonedspoon4.jpg',
            fHDImageAssetPath: 'assets/images/1080/seasonedspoon4.jpg',
          ),
        ],
      ),
    ],
  ),
  TrentCenterModel(
    trentCenterName: 'Chemical Sciences Building',
    trentCenterCode: 'CSB',
    trentCenter: TrentCenters.chemicalScience,
    reviewImageAssetPath: 'assets/images/review/CSB_Center.jpg',
    hDImageAssetPath: 'assets/images/720/CSB_Center.jpg',
    expansionTileController: ExpansionTileController(),
    trentCenterFloors: <TrentFloorModel?>[
      TrentFloorModel(
        floorNumber: '1',
        floorName: '1st Floor',
        floorCenter: TrentCenters.chemicalScience,
        expansionTileController: ExpansionTileController(),
        rooms: const <TrentRoomModel?>[
          TrentRoomModel(
            roomNumber: 'D101',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Walk down the pathway and take a left on the next pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Open the doors to the Chemical Science Building and head downstairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetochemscience4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetochemscience4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetochemscience4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'When you reach the bottom of the staircase, your classroom will be behind the staircase on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/chemscience4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/chemscience4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/chemscience4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Chemical Science Building - Chemistry Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/CSBD101.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/CSBD101.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/CSBD101.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.chemicalScience,
            roomType: 'Chemistry Lab',
            roomCapacity: 'N/A',
            centerCode: 'CSB',
            reviewImageAssetPath: 'assets/images/review/CSBD101.jpg',
            hDImageAssetPath: 'assets/images/720/CSBD101.jpg',
            fHDImageAssetPath: 'assets/images/1080/CSBD101.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'D109',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Walk down the pathway and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetochemscience2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetochemscience2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetochemscience2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Open the doors to the Chemical Science Building and head downstairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetochemscience.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetochemscience.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetochemscience.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Walk downstairs and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/chemscience1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/chemscience1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/chemscience1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Head down the hallway and take a left turn at the first corridor entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/chemscience8.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/chemscience8.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/chemscience8.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Champlain College - Seminar Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/CSBD109.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/CSBD109.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/CSBD109.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.chemicalScience,
            roomType: 'Chemistry Lab',
            roomCapacity: 'N/A',
            centerCode: 'CSB',
            reviewImageAssetPath: 'assets/images/review/CSBD109.jpg',
            hDImageAssetPath: 'assets/images/720/CSBD109.jpg',
            fHDImageAssetPath: 'assets/images/1080/CSBD109.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'D113',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Walk down the pathway and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetochemscience2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetochemscience2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetochemscience2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Open the doors to the Chemical Science Building and head downstairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetochemscience.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetochemscience.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetochemscience.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Walk downstairs and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/chemscience1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/chemscience1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/chemscience1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Head down the hallways and take a left turn at the second corridor entrace.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/chemscience9.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/chemscience9.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/chemscience9.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Chemical Science Building - Chemistry Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/CSBD113.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/CSBD113.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/CSBD113.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.chemicalScience,
            roomType: 'Chemistry Lab',
            roomCapacity: 'N/A',
            centerCode: 'CSB',
            reviewImageAssetPath: 'assets/images/review/CSBD113.jpg',
            hDImageAssetPath: 'assets/images/720/CSBD113.jpg',
            fHDImageAssetPath: 'assets/images/1080/CSBD113.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'D116',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Walk down the pathway and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetochemscience2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetochemscience2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetochemscience2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Open the doors to the Chemical Science Building and head downstairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetochemscience.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetochemscience.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetochemscience.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Walk downstairs and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/chemscience1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/chemscience1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/chemscience1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Head down the hallways and take a left turn at the second corridor entrace.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/chemscience9.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/chemscience9.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/chemscience9.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Chemical Science Building - Chemistry Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/CSBD116.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/CSBD116.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/CSBD116.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.chemicalScience,
            roomType: 'Chemistry Lab',
            roomCapacity: 'N/A',
            centerCode: 'CSB',
            reviewImageAssetPath: 'assets/images/review/CSBD116.jpg',
            hDImageAssetPath: 'assets/images/720/CSBD116.jpg',
            fHDImageAssetPath: 'assets/images/1080/CSBD116.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'E101',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Walk down the pathway and take a left on the next pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Open the doors to the Chemical Science Building and head downstairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetochemscience4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetochemscience4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetochemscience4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'When you reach the bottom of the staircase, your classroom will be behind the staircase and down the hallway on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/chemscience5.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/chemscience5.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/chemscience5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Chemical Science Building - Chemistry Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/CSBE101.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/CSBE101.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/CSBE101.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.chemicalScience,
            roomType: 'Chemistry Lab',
            roomCapacity: '25',
            centerCode: 'CSB',
            reviewImageAssetPath: 'assets/images/review/CSBE101.jpg',
            hDImageAssetPath: 'assets/images/720/CSBE101.jpg',
            fHDImageAssetPath: 'assets/images/1080/CSBE101.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'E103',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Walk down the pathway and take a left on the next pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Open the doors to the Chemical Science Building and head downstairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetochemscience4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetochemscience4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetochemscience4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'When you reach the bottom of the staircase, your room will be at the first corridor on the right',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/chemscience6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/chemscience6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/chemscience6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Chemical Science Building - Chemistry Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/CSBE103.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/CSBE103.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/CSBE103.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.chemicalScience,
            roomType: 'Chemistry Lab',
            roomCapacity: 'N/A',
            centerCode: 'CSB',
            reviewImageAssetPath: 'assets/images/review/CSBE103.jpg',
            hDImageAssetPath: 'assets/images/720/CSBE103.jpg',
            fHDImageAssetPath: 'assets/images/1080/CSBE103.jpg',
          ),
        ],
      ),
    ],
  ),
  TrentCenterModel(
    trentCenterName: 'DNA Building',
    trentCenterCode: 'DNA',
    trentCenter: TrentCenters.dNABuilding,
    reviewImageAssetPath: 'assets/images/review/DNA_Center.jpg',
    hDImageAssetPath: 'assets/images/720/DNA_Center.jpg',
    expansionTileController: ExpansionTileController(),
    trentCenterFloors: <TrentFloorModel?>[
      TrentFloorModel(
        floorNumber: '1',
        floorName: '1st Floor',
        floorCenter: TrentCenters.dNABuilding,
        expansionTileController: ExpansionTileController(),
        rooms: const <TrentRoomModel?>[
          TrentRoomModel(
            roomNumber: 'D103',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Head towards the entrance doors of Otonabee College on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Enter Otonabee College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee11.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee11.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk up the stairs and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Walk down the hallway and head straight to the end, then take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Walk straight down another hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee18.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee18.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Ascend the three flights of stairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee35.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee35.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee35.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Walk straight down the hallway, heading towards the exit.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee38.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee38.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Walk up the stairs, out the exit doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee19.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee19.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '14',
                  stepDescription:
                      'When leaving Otonabee College, take left turn and walk down the street (or path). Take a right turn towards the DNA Building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '15',
                  stepDescription:
                      'Walk to the DNA Building main entrance, open the doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '16',
                  stepDescription:
                      'On entering the building, take a left turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '17',
                  stepDescription:
                      'Walk straight down to the end of the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '18',
                  stepDescription: 'Open the hallway doors to Block C',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '19',
                  stepDescription:
                      'Walk straight down the hallway towards Block D.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding8.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding8.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding8.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '20',
                  stepDescription:
                      'Keep walking down the hallway, your room will be up on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding9.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding9.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding9.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '21',
                  stepDescription: 'DNA Building - Biology Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/DNAD103.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/DNAD103.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/DNAD103.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.dNABuilding,
            roomType: 'Biology Lab',
            roomCapacity: 'N/A',
            centerCode: 'DNA',
            reviewImageAssetPath: 'assets/images/review/DNAD103.jpg',
            hDImageAssetPath: 'assets/images/720/DNAD103.jpg',
            fHDImageAssetPath: 'assets/images/1080/DNAD103.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'B104',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Head towards the entrance doors of Otonabee College on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Enter Otonabee College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee11.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee11.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk up the stairs and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Walk down the hallway and head straight to the end, then take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Walk straight down another hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee18.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee18.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Ascend the three flights of stairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee35.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee35.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee35.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Walk straight down the hallway, heading towards the exit.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee38.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee38.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Walk up the stairs, out the exit doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee19.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee19.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '14',
                  stepDescription:
                      'When leaving Otonabee College, take left turn and walk down the street (or path). Take a right turn towards the DNA Building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '15',
                  stepDescription:
                      'Walk to the DNA Building main entrance, open the doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '16',
                  stepDescription:
                      'On entering the building, take a left turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '17',
                  stepDescription:
                      'Walk down the hallway and take a right at the first corridor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding11.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding11.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '18',
                  stepDescription:
                      'After opening the corridor doors, wall down the hallway and take a right or left turn to find your room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '19',
                  stepDescription: 'DNA Building - Lecture Hall',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/DNAB104.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/DNAB104.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/DNAB104.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.dNABuilding,
            roomType: 'Lecture Hall',
            roomCapacity: '60',
            centerCode: 'DNA',
            reviewImageAssetPath: 'assets/images/review/DNAB104.jpg',
            hDImageAssetPath: 'assets/images/720/DNAB104.jpg',
            fHDImageAssetPath: 'assets/images/1080/DNAB104.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'B105',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Head towards the entrance doors of Otonabee College on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Enter Otonabee College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee11.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee11.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk up the stairs and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Walk down the hallway and head straight to the end, then take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Walk straight down another hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee18.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee18.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Ascend the three flights of stairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee35.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee35.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee35.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Walk straight down the hallway, heading towards the exit.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee38.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee38.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Walk up the stairs, out the exit doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee19.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee19.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '14',
                  stepDescription:
                      'When leaving Otonabee College, take left turn and walk down the street (or path). Take a right turn towards the DNA Building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '15',
                  stepDescription:
                      'Walk to the DNA Building main entrance, open the doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '16',
                  stepDescription:
                      'On entering the building, take a left turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '17',
                  stepDescription:
                      'Walk down the hallway and take a right at the first corridor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding11.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding11.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '18',
                  stepDescription:
                      'After opening the corridor doors, wall down the hallway and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding5.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding5.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '19',
                  stepDescription:
                      'Walk down the hallway, your room is on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '20',
                  stepDescription: 'DNA Building - Seminar Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/DNAB105.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/DNAB105.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/DNAB105.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.dNABuilding,
            roomType: 'Seminar Room',
            roomCapacity: '30',
            centerCode: 'DNA',
            reviewImageAssetPath: 'assets/images/review/DNAB105.jpg',
            hDImageAssetPath: 'assets/images/720/DNAB105.jpg',
            fHDImageAssetPath: 'assets/images/1080/DNAB105.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'D105',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Head towards the entrance doors of Otonabee College on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Enter Otonabee College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee11.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee11.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk up the stairs and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Walk down the hallway and head straight to the end, then take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Walk straight down another hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee18.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee18.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Ascend the three flights of stairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee35.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee35.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee35.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Walk straight down the hallway, heading towards the exit.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee38.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee38.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Walk up the stairs, out the exit doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee19.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee19.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '14',
                  stepDescription:
                      'When leaving Otonabee College, take left turn and walk down the street (or path). Take a right turn towards the DNA Building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '15',
                  stepDescription:
                      'Walk to the DNA Building main entrance, open the doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '16',
                  stepDescription:
                      'On entering the building, take a left turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '17',
                  stepDescription:
                      'Walk straight down to the end of the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '18',
                  stepDescription: 'Open the hallway doors to Block C',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '19',
                  stepDescription:
                      'Walk straight down the hallway towards Block D.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding8.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding8.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding8.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '20',
                  stepDescription:
                      'Keep walking down the hallway, your room will be up on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding9.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding9.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding9.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '21',
                  stepDescription: 'DNA Building - Biology Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/DNAD105.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/DNAD105.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/DNAD105.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.dNABuilding,
            roomType: 'Biology Lab',
            roomCapacity: 'N/A',
            centerCode: 'DNA',
            reviewImageAssetPath: 'assets/images/review/DNAD105.jpg',
            hDImageAssetPath: 'assets/images/720/DNAD105.jpg',
            fHDImageAssetPath: 'assets/images/1080/DNAD105.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'D106',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Head towards the entrance doors of Otonabee College on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Enter Otonabee College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee11.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee11.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk up the stairs and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Walk down the hallway and head straight to the end, then take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Walk straight down another hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee18.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee18.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Ascend the three flights of stairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee35.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee35.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee35.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Walk straight down the hallway, heading towards the exit.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee38.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee38.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Walk up the stairs, out the exit doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee19.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee19.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '14',
                  stepDescription:
                      'When leaving Otonabee College, take left turn and walk down the street (or path). Take a right turn towards the DNA Building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '15',
                  stepDescription:
                      'Walk to the DNA Building main entrance, open the doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '16',
                  stepDescription:
                      'On entering the building, take a left turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '17',
                  stepDescription:
                      'Walk straight down to the end of the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '18',
                  stepDescription: 'Open the hallway doors to Block C',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '19',
                  stepDescription:
                      'Walk straight down the hallway towards Block D.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding8.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding8.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding8.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '20',
                  stepDescription:
                      'Keep walking down the hallway, your room will be up on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding9.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding9.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding9.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '21',
                  stepDescription: 'DNA Building - Biology Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/DNAD106.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/DNAD106.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/DNAD106.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.dNABuilding,
            roomType: 'Biology Lab',
            roomCapacity: 'N/A',
            centerCode: 'DNA',
            reviewImageAssetPath: 'assets/images/review/DNAD106.jpg',
            hDImageAssetPath: 'assets/images/720/DNAD106.jpg',
            fHDImageAssetPath: 'assets/images/1080/DNAD106.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'D108',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Head towards the entrance doors of Otonabee College on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Enter Otonabee College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee11.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee11.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk up the stairs and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Walk down the hallway and head straight to the end, then take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Walk straight down another hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee18.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee18.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Ascend the three flights of stairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee35.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee35.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee35.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Walk straight down the hallway, heading towards the exit.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee38.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee38.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Walk up the stairs, out the exit doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee19.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee19.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '14',
                  stepDescription:
                      'When leaving Otonabee College, take left turn and walk down the street (or path). Take a right turn towards the DNA Building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '15',
                  stepDescription:
                      'Walk to the DNA Building main entrance, open the doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '16',
                  stepDescription:
                      'On entering the building, take a left turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '17',
                  stepDescription:
                      'Walk straight down to the end of the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '18',
                  stepDescription: 'Open the hallway doors to Block C',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '19',
                  stepDescription:
                      'Walk straight down the hallway towards Block D.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding8.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding8.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding8.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '20',
                  stepDescription:
                      'Keep walking down the hallway, your room will be up on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding9.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding9.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding9.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '21',
                  stepDescription: 'DNA Building - Biology Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/DNAD108.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/DNAD108.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/DNAD108.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.dNABuilding,
            roomType: 'Biology Lab',
            roomCapacity: 'N/A',
            centerCode: 'DNA',
            reviewImageAssetPath: 'assets/images/review/DNAD108.jpg',
            hDImageAssetPath: 'assets/images/720/DNAD108.jpg',
            fHDImageAssetPath: 'assets/images/1080/DNAD108.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'B110.1',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Head towards the entrance doors of Otonabee College on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Enter Otonabee College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee11.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee11.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk up the stairs and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Walk down the hallway and head straight to the end, then take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Walk straight down another hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee18.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee18.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Ascend the three flights of stairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee35.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee35.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee35.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Walk straight down the hallway, heading towards the exit.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee38.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee38.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Walk up the stairs, out the exit doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee19.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee19.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '14',
                  stepDescription:
                      'When leaving Otonabee College, take left turn and walk down the street (or path). Take a right turn towards the DNA Building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '15',
                  stepDescription:
                      'Walk to the DNA Building main entrance, open the doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '16',
                  stepDescription:
                      'On entering the building, take a left turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '17',
                  stepDescription:
                      'Walk down the hallway, the room will be up on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding18.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding18.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '18',
                  stepDescription: 'DNA Building - Classroom',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/DNAB110.1.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/DNAB110.1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/DNAB110.1.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.dNABuilding,
            roomType: 'Classroom',
            roomCapacity: '40',
            centerCode: 'DNA',
            reviewImageAssetPath: 'assets/images/review/DNAB110.1.jpg',
            hDImageAssetPath: 'assets/images/720/DNAB110.1.jpg',
            fHDImageAssetPath: 'assets/images/1080/DNAB110.1.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'B110.2',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Head towards the entrance doors of Otonabee College on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Enter Otonabee College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee11.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee11.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk up the stairs and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Walk down the hallway and head straight to the end, then take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Walk straight down another hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee18.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee18.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Ascend the three flights of stairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee35.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee35.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee35.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Walk straight down the hallway, heading towards the exit.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee38.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee38.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Walk up the stairs, out the exit doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee19.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee19.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '14',
                  stepDescription:
                      'When leaving Otonabee College, take left turn and walk down the street (or path). Take a right turn towards the DNA Building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '15',
                  stepDescription:
                      'Walk to the DNA Building main entrance, open the doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '16',
                  stepDescription:
                      'On entering the building, take a left turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '17',
                  stepDescription:
                      'Walk down the hallway, the room will be up on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding19.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding19.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '18',
                  stepDescription: 'DNA Building - Classroom',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/DNAB110.2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/DNAB110.2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/DNAB110.2.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.dNABuilding,
            roomType: 'Classroom',
            roomCapacity: '40',
            centerCode: 'DNA',
            reviewImageAssetPath: 'assets/images/review/DNAB110.2.jpg',
            hDImageAssetPath: 'assets/images/720/DNAB110.2.jpg',
            fHDImageAssetPath: 'assets/images/1080/DNAB110.2.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'B113',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Head towards the entrance doors of Otonabee College on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Enter Otonabee College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee11.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee11.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk up the stairs and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Walk down the hallway and head straight to the end, then take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Walk straight down another hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee18.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee18.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Ascend the three flights of stairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee35.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee35.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee35.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Walk straight down the hallway, heading towards the exit.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee38.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee38.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Walk up the stairs, out the exit doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee19.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee19.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '14',
                  stepDescription:
                      'When leaving Otonabee College, take left turn and walk down the street (or path). Take a right turn towards the DNA Building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '15',
                  stepDescription:
                      'Walk to the DNA Building main entrance, open the doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '16',
                  stepDescription:
                      'On entering the building, take a left turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '17',
                  stepDescription:
                      'Walk down the hallway, your room will be up on your left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding20.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding20.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding20.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '18',
                  stepDescription: 'DNA Building - Forensics Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/DNAB113.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/DNAB113.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/DNAB113.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.dNABuilding,
            roomType: 'Forensics Lab',
            roomCapacity: '25',
            centerCode: 'DNA',
            reviewImageAssetPath: 'assets/images/review/DNAB113.jpg',
            hDImageAssetPath: 'assets/images/720/DNAB113.jpg',
            fHDImageAssetPath: 'assets/images/1080/DNAB113.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'C141',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Head towards the entrance doors of Otonabee College on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Enter Otonabee College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee11.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee11.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk up the stairs and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Walk down the hallway and head straight to the end, then take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Walk straight down another hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee18.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee18.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Ascend the three flights of stairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee35.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee35.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee35.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Walk straight down the hallway, heading towards the exit.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee38.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee38.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Walk up the stairs, out the exit doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee19.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee19.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '14',
                  stepDescription:
                      'When leaving Otonabee College, take left turn and walk down the street (or path). Take a right turn towards the DNA Building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '15',
                  stepDescription:
                      'Walk to the DNA Building main entrance, open the doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '16',
                  stepDescription:
                      'On entering the building, take a left turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '17',
                  stepDescription:
                      'Walk straight down to the end of the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '18',
                  stepDescription: 'Open the hallway doors to Block C',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '19',
                  stepDescription:
                      'Walk down the hallway, your room will be up on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding40.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding40.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding40.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '20',
                  stepDescription: 'DNA Building - Nursing Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/DNAC141.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/DNAC141.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/DNAC141.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.dNABuilding,
            roomType: 'Nursing Lab',
            roomCapacity: '25',
            centerCode: 'DNA',
            reviewImageAssetPath: 'assets/images/review/DNAC141.jpg',
            hDImageAssetPath: 'assets/images/720/DNAC141.jpg',
            fHDImageAssetPath: 'assets/images/1080/DNAC141.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'C142',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Head towards the entrance doors of Otonabee College on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Enter Otonabee College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee11.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee11.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk up the stairs and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Walk down the hallway and head straight to the end, then take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Walk straight down another hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee18.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee18.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Ascend the three flights of stairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee35.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee35.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee35.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Walk straight down the hallway, heading towards the exit.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee38.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee38.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Walk up the stairs, out the exit doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee19.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee19.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '14',
                  stepDescription:
                      'When leaving Otonabee College, take left turn and walk down the street (or path). Take a right turn towards the DNA Building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '15',
                  stepDescription:
                      'Walk to the DNA Building main entrance, open the doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '16',
                  stepDescription:
                      'On entering the building, take a left turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '17',
                  stepDescription:
                      'Walk straight down to the end of the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '18',
                  stepDescription: 'Open the hallway doors to Block C',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '19',
                  stepDescription:
                      'Walk down the hallway, your room will be up on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding40.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding40.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding40.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '20',
                  stepDescription: 'DNA Building - Nursing Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/DNAC142.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/DNAC142.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/DNAC142.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.dNABuilding,
            roomType: 'Nursing Lab',
            roomCapacity: '25',
            centerCode: 'DNA',
            reviewImageAssetPath: 'assets/images/review/DNAC142.jpg',
            hDImageAssetPath: 'assets/images/720/DNAC142.jpg',
            fHDImageAssetPath: 'assets/images/1080/DNAC142.jpg',
          ),
        ],
      ),
      TrentFloorModel(
        floorNumber: '2',
        floorName: '2nd Floor',
        floorCenter: TrentCenters.dNABuilding,
        expansionTileController: ExpansionTileController(),
        rooms: const <TrentRoomModel?>[
          TrentRoomModel(
            roomNumber: 'D202',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Head towards the entrance doors of Otonabee College on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Enter Otonabee College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee11.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee11.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk up the stairs and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Walk down the hallway and head straight to the end, then take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Walk straight down another hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee18.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee18.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Ascend the three flights of stairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee35.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee35.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee35.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Walk straight down the hallway, heading towards the exit.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee38.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee38.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Walk up the stairs, out the exit doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee19.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee19.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '14',
                  stepDescription:
                      'When leaving Otonabee College, take left turn and walk down the street (or path). Take a right turn towards the DNA Building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '15',
                  stepDescription:
                      'Walk to the DNA Building main entrance, open the doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '16',
                  stepDescription:
                      'On entering the building, take a left turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '17',
                  stepDescription:
                      'Walk straight down to the end of the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '18',
                  stepDescription: 'Open the hallway doors to Block C',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '19',
                  stepDescription:
                      'Walk straight down the hallway towards Block D.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding8.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding8.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding8.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '20',
                  stepDescription: 'Keep walking down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding9.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding9.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding9.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '21',
                  stepDescription:
                      'Take a left up the stairway, or use the elevator, to get to the second floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding12.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding12.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding12.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '22',
                  stepDescription: 'Up the stairway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding38.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding38.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '23',
                  stepDescription:
                      'On exiting the stairway or elavator, take a left turn and walk down the hallway to your room up on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding13.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '24',
                  stepDescription: 'DNA Building - Biology Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/DNAD202.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/DNAD202.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/DNAD202.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.dNABuilding,
            roomType: 'Biology Lab',
            roomCapacity: 'N/A',
            centerCode: 'DNA',
            reviewImageAssetPath: 'assets/images/review/DNAD202.jpg',
            hDImageAssetPath: 'assets/images/720/DNAD202.jpg',
            fHDImageAssetPath: 'assets/images/1080/DNAD202.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'D208',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Head towards the entrance doors of Otonabee College on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Enter Otonabee College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee11.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee11.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk up the stairs and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Walk down the hallway and head straight to the end, then take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Walk straight down another hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee18.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee18.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Ascend the three flights of stairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee35.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee35.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee35.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Walk straight down the hallway, heading towards the exit.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee38.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee38.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Walk up the stairs, out the exit doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee19.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee19.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '14',
                  stepDescription:
                      'When leaving Otonabee College, take left turn and walk down the street (or path). Take a right turn towards the DNA Building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '15',
                  stepDescription:
                      'Walk to the DNA Building main entrance, open the doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '16',
                  stepDescription:
                      'On entering the building, take a left turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '17',
                  stepDescription:
                      'Walk straight down to the end of the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '18',
                  stepDescription: 'Open the hallway doors to Block C',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '19',
                  stepDescription:
                      'Walk straight down the hallway towards Block D.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding8.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding8.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding8.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '20',
                  stepDescription: 'Keep walking down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding9.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding9.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding9.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '21',
                  stepDescription:
                      'Take a left up the stairway, or use the elevator, to get to the second floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding12.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding12.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding12.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '22',
                  stepDescription: 'Up the stairway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding38.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding38.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '23',
                  stepDescription:
                      'On exiting the stairway or elavator, take a left turn and walk down the hallway to your room up on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding13.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '24',
                  stepDescription: 'DNA Building - Biology Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/DNAD208.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/DNAD208.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/DNAD208.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.dNABuilding,
            roomType: 'Biology Lab',
            roomCapacity: 'N/a',
            centerCode: 'DNA',
            reviewImageAssetPath: 'assets/images/review/DNAD208.jpg',
            hDImageAssetPath: 'assets/images/720/DNAD208.jpg',
            fHDImageAssetPath: 'assets/images/1080/DNAD208.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'C215',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Head towards the entrance doors of Otonabee College on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Enter Otonabee College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee11.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee11.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk up the stairs and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Walk down the hallway and head straight to the end, then take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Walk straight down another hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee18.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee18.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Ascend the three flights of stairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee35.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee35.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee35.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Walk straight down the hallway, heading towards the exit.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee38.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee38.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Walk up the stairs, out the exit doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee19.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee19.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '14',
                  stepDescription:
                      'When leaving Otonabee College, take left turn and walk down the street (or path). Take a right turn towards the DNA Building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '15',
                  stepDescription:
                      'Walk to the DNA Building main entrance, open the doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '16',
                  stepDescription:
                      'On entering the building, take a left turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '17',
                  stepDescription:
                      'Walk straight down to the end of the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '18',
                  stepDescription:
                      'Walk through the hallway doors to Block C and turn to your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding26.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding26.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding26.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '19',
                  stepDescription:
                      'Open the door to the second floor stairway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding28.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding28.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding28.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '20',
                  stepDescription: 'Walk upstairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding27.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding27.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding27.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '21',
                  stepDescription:
                      'Take a left at the first hallway entrance and open the doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding31.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding31.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding31.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '22',
                  stepDescription:
                      'Walk down the hallway and take a right turn at the end.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding15.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding15.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding15.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '23',
                  stepDescription:
                      'Walk down the hallway, your room will be on your right',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding34.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding34.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding34.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '24',
                  stepDescription: 'DNA Building - Anthro Morin Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/DNAC215.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/DNAC215.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/DNAC215.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.dNABuilding,
            roomType: 'Anthro Morin Lab',
            roomCapacity: 'N/A',
            centerCode: 'DNA',
            reviewImageAssetPath: 'assets/images/review/DNAC215.jpg',
            hDImageAssetPath: 'assets/images/720/DNAC215.jpg',
            fHDImageAssetPath: 'assets/images/1080/DNAC215.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'C231',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Head towards the entrance doors of Otonabee College on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Enter Otonabee College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee11.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee11.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk up the stairs and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Walk down the hallway and head straight to the end, then take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Walk straight down another hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee18.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee18.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Ascend the three flights of stairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee35.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee35.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee35.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Walk straight down the hallway, heading towards the exit.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee38.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee38.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Walk up the stairs, out the exit doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee19.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee19.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '14',
                  stepDescription:
                      'When leaving Otonabee College, take left turn and walk down the street (or path). Take a right turn towards the DNA Building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '15',
                  stepDescription:
                      'Walk to the DNA Building main entrance, open the doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '16',
                  stepDescription:
                      'On entering the building, take a left turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '17',
                  stepDescription:
                      'Walk straight down to the end of the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '18',
                  stepDescription:
                      'Walk through the hallway doors to Block C and turn to your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding26.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding26.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding26.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '19',
                  stepDescription:
                      'Open the door to the second floor stairway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding28.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding28.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding28.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '20',
                  stepDescription: 'Walk upstairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding27.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding27.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding27.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '21',
                  stepDescription:
                      'Walk down the hallway, your room will be up on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding32.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding32.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding32.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '22',
                  stepDescription: 'DNA Building - Anthro/Forensics Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/DNAC231.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/DNAC231.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/DNAC231.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.dNABuilding,
            roomType: 'Anthro/Forensics Lab',
            roomCapacity: '30',
            centerCode: 'DNA',
            reviewImageAssetPath: 'assets/images/review/DNAC231.jpg',
            hDImageAssetPath: 'assets/images/720/DNAC231.jpg',
            fHDImageAssetPath: 'assets/images/1080/DNAC231.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'C233',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Head towards the entrance doors of Otonabee College on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Enter Otonabee College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee11.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee11.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk up the stairs and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Walk down the hallway and head straight to the end, then take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Walk straight down another hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee18.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee18.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Ascend the three flights of stairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee35.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee35.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee35.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Walk straight down the hallway, heading towards the exit.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee38.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee38.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Walk up the stairs, out the exit doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee19.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee19.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '14',
                  stepDescription:
                      'When leaving Otonabee College, take left turn and walk down the street (or path). Take a right turn towards the DNA Building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '15',
                  stepDescription:
                      'Walk to the DNA Building main entrance, open the doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '16',
                  stepDescription:
                      'On entering the building, take a left turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '17',
                  stepDescription:
                      'Walk straight down to the end of the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '18',
                  stepDescription:
                      'Walk through the hallway doors to Block C and turn to your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding26.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding26.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding26.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '19',
                  stepDescription:
                      'Open the door to the second floor stairway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding28.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding28.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding28.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '20',
                  stepDescription: 'Walk upstairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding27.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding27.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding27.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '21',
                  stepDescription:
                      'Walk down the hallway, your room will be up on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding33.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding33.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding33.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '22',
                  stepDescription: 'DNA Building - Anthro Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/DNAC233.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/DNAC233.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/DNAC233.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.dNABuilding,
            roomType: 'Anthro Lab',
            roomCapacity: '25',
            centerCode: 'DNA',
            reviewImageAssetPath: 'assets/images/review/DNAC233.jpg',
            hDImageAssetPath: 'assets/images/720/DNAC233.jpg',
            fHDImageAssetPath: 'assets/images/1080/DNAC233.jpg',
          ),
        ],
      ),
    ],
  ),
  TrentCenterModel(
    trentCenterName: 'Lady Eaton College',
    trentCenterCode: 'ECC',
    trentCenter: TrentCenters.ladyEatonCollege,
    reviewImageAssetPath: 'assets/images/review/ECC_Center.jpg',
    hDImageAssetPath: 'assets/images/720/ECC_Center.jpg',
    expansionTileController: ExpansionTileController(),
    trentCenterFloors: <TrentFloorModel?>[
      TrentFloorModel(
        floorNumber: '2',
        floorName: '2nd Floor',
        floorCenter: TrentCenters.ladyEatonCollege,
        expansionTileController: ExpansionTileController(),
        rooms: const <TrentRoomModel?>[
          TrentRoomModel(
            roomNumber: '201',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank and towards the overhead walkway up on your left.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'Walk straight down the overhead walkway towards the library doors. Enter the library.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata10.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'On entering the hallway take a left turn down the steps up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata11.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata11.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Walk straight ahead towards the library doors up on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata12.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata12.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata12.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Walk straight towards the entrance doors and enter the library.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata13.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata13.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'On entering the library walk straight and take a left turn around the wall.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata14.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata14.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata14.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Walk straight towards your room up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata18.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata18.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Bata Library - Computer Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata201.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata201.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata201.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.ladyEatonCollege,
            roomType: 'Lecture Hall',
            roomCapacity: '100',
            centerCode: 'ECC',
            reviewImageAssetPath: 'assets/images/review/ECC201.jpg',
            hDImageAssetPath: 'assets/images/720/ECC201.jpg',
            fHDImageAssetPath: 'assets/images/1080/ECC201.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'D208',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Head towards the entrance doors of Otonabee College on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Enter Otonabee College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee11.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee11.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk up the stairs and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee10.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Walk down the hallway and head straight to the end, then take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Walk straight down another hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee18.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee18.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Ascend the three flights of stairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee35.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee35.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee35.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Walk straight down the hallway, heading towards the exit.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee38.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee38.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Walk up the stairs, out the exit doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee19.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee19.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '14',
                  stepDescription:
                      'When leaving Otonabee College, take left turn and walk down the street (or path). Take a right turn towards the DNA Building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '15',
                  stepDescription:
                      'Walk to the DNA Building main entrance, open the doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '16',
                  stepDescription:
                      'On entering the building, take a left turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '17',
                  stepDescription:
                      'Walk straight down to the end of the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '18',
                  stepDescription: 'Open the hallway doors to Block C',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '19',
                  stepDescription:
                      'Walk straight down the hallway towards Block D.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding8.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding8.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding8.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '20',
                  stepDescription: 'Keep walking down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding9.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding9.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding9.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '21',
                  stepDescription:
                      'Take a left up the stairway, or use the elevator, to get to the second floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding12.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding12.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding12.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '22',
                  stepDescription: 'Up the stairway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding38.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding38.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding38.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '23',
                  stepDescription:
                      'On exiting the stairway or elavator, take a left turn and walk down the hallway to your room up on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/dnabuilding13.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/dnabuilding13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/dnabuilding13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '24',
                  stepDescription: 'DNA Building - Biology Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/DNAD208.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/DNAD208.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/DNAD208.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.ladyEatonCollege,
            roomType: 'Seminar Room',
            roomCapacity: '20',
            centerCode: 'DNA',
            reviewImageAssetPath: 'assets/images/review/DNAD208.jpg',
            hDImageAssetPath: 'assets/images/720/DNAD208.jpg',
            fHDImageAssetPath: 'assets/images/1080/DNAD208.jpg',
          ),
          TrentRoomModel(
            roomNumber: '208',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you are leaving the bridge stay to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'Keep walking straight towards Lady Eaton College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoladyeaton3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoladyeaton3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoladyeaton3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Continue walking towards Lady Eaton College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoladyeaton.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoladyeaton.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoladyeaton.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoladyeaton2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoladyeaton2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoladyeaton2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Walk down the hallway on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ladyeaton.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ladyeaton.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/ladyeaton.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Take a left turn at the end of the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ladyeaton13.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/ladyeaton13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/ladyeaton13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Take a right turn, your room will be just around the corner.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ladyeaton5.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ladyeaton5.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/ladyeaton5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription: 'Lady Eaton College - Seminar Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ECC208.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ECC208.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/ECC208.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.ladyEatonCollege,
            roomType: 'Seminar Room',
            roomCapacity: '40',
            centerCode: 'ECC',
            reviewImageAssetPath: 'assets/images/review/ECC208.jpg',
            hDImageAssetPath: 'assets/images/720/ECC208.jpg',
            fHDImageAssetPath: 'assets/images/1080/ECC208.jpg',
          ),
          TrentRoomModel(
            roomNumber: '212',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you are leaving the bridge stay to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'Keep walking straight towards Lady Eaton College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoladyeaton3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoladyeaton3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoladyeaton3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Continue walking towards Lady Eaton College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoladyeaton.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoladyeaton.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoladyeaton.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoladyeaton2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoladyeaton2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoladyeaton2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Take a left turn and walk down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ladyeaton2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ladyeaton2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/ladyeaton2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'As you walk down the hallway stay on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ladyeaton3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ladyeaton3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/ladyeaton3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk down the stairs and to the right to get to your room.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ladyeaton4.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ladyeaton4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/ladyeaton4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription: 'Lady Eaton College - Seminar Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ECC212.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ECC212.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/ECC212.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.ladyEatonCollege,
            roomType: 'Seminar Room',
            roomCapacity: '25',
            centerCode: 'ECC',
            reviewImageAssetPath: 'assets/images/review/ECC212.jpg',
            hDImageAssetPath: 'assets/images/720/ECC212.jpg',
            fHDImageAssetPath: 'assets/images/1080/ECC212.jpg',
          ),
        ],
      ),
    ],
  ),
  TrentCenterModel(
    trentCenterName: 'Environmental Science Center',
    trentCenterCode: 'ESC',
    trentCenter: TrentCenters.enviroScienceCenter,
    reviewImageAssetPath: 'assets/images/review/ESC_Center.jpg',
    hDImageAssetPath: 'assets/images/720/ESC_Center.jpg',
    expansionTileController: ExpansionTileController(),
    trentCenterFloors: <TrentFloorModel?>[
      TrentFloorModel(
        floorNumber: '1',
        floorName: '1st Floor',
        floorCenter: TrentCenters.enviroScienceCenter,
        expansionTileController: ExpansionTileController(),
        rooms: const <TrentRoomModel?>[
          TrentRoomModel(
            roomNumber: 'C111.3',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'Keep walking straight towards the entrance of the Environmental Science Center.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'On entering the building, walk straight down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Keep walking towards the hallway exit.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Walk down the hallway to the stairs. Head downstairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'At the bottom on the stairs take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk to the next corridor entrance straight ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience8.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience8.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience8.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk to the very end of the hallway, your room should be on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience33.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience33.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience33.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Environmental Science Center - Geography Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ESCC111.3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ESCC111.3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/ESCC111.3.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.enviroScienceCenter,
            roomType: 'Geomorphology Lab',
            roomCapacity: 'N/A',
            centerCode: 'ESC',
            reviewImageAssetPath: 'assets/images/review/ESCC111.3.jpg',
            hDImageAssetPath: 'assets/images/720/ESCC111.3.jpg',
            fHDImageAssetPath: 'assets/images/1080/ESCC111.3.jpg',
          ),
        ],
      ),
      TrentFloorModel(
        floorNumber: '2',
        floorName: '2nd Floor',
        floorCenter: TrentCenters.enviroScienceCenter,
        expansionTileController: ExpansionTileController(),
        rooms: const <TrentRoomModel?>[
          TrentRoomModel(
            roomNumber: 'A202',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'Keep walking straight towards the entrance of the Environmental Science Center.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'On entering the hallway of the building, your room will be on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Environmental Science Center - ERS Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ESCA202.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ESCA202.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/ESCA202.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.enviroScienceCenter,
            roomType: 'ERS Lab',
            roomCapacity: 'N/A',
            centerCode: 'ESC',
            reviewImageAssetPath: 'assets/images/review/ESCA202.jpg',
            hDImageAssetPath: 'assets/images/720/ESCA202.jpg',
            fHDImageAssetPath: 'assets/images/1080/ESCA202.jpg',
          ),
          TrentRoomModel(
            roomNumber: '208',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you are leaving the bridge stay to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'Keep walking straight towards Lady Eaton College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoladyeaton3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoladyeaton3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoladyeaton3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Continue walking towards Lady Eaton College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoladyeaton.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoladyeaton.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoladyeaton.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoladyeaton2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoladyeaton2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoladyeaton2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Walk down the hallway on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ladyeaton.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ladyeaton.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/ladyeaton.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Take a left turn at the end of the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ladyeaton13.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/ladyeaton13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/ladyeaton13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Take a right turn, your room will be just around the corner.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ladyeaton5.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ladyeaton5.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/ladyeaton5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription: 'Lady Eaton College - Seminar Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ECC208.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ECC208.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/ECC208.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.enviroScienceCenter,
            roomType: 'Seminar Room',
            roomCapacity: '40',
            centerCode: 'ECC',
            reviewImageAssetPath: 'assets/images/review/ECC208.jpg',
            hDImageAssetPath: 'assets/images/720/ECC208.jpg',
            fHDImageAssetPath: 'assets/images/1080/ECC208.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'C202',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'Keep walking straight towards the entrance of the Environmental Science Center.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'On entering the building, walk straight down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Keep walking towards the hallway exit.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Walk down the hallway to the end.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Enter the next hallway entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience5.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience5.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'The room will be down the hallway to your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience31.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience31.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience31.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Environmental Science Center - Geography Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ESCC202.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ESCC202.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/ESCC202.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.enviroScienceCenter,
            roomType: 'Geography Lab',
            roomCapacity: 'N/A',
            centerCode: 'ESC',
            reviewImageAssetPath: 'assets/images/review/ESCC202.jpg',
            hDImageAssetPath: 'assets/images/720/ESCC202.jpg',
            fHDImageAssetPath: 'assets/images/1080/ESCC202.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'B203',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Walk down the pathway and take a left towards the entrance of the Environmental Science Center.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Enter the building and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro5.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro5.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Your room will be through the doors on your left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience12.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience12.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience12.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Environmental Science Center - Lecture Hall',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ESCB203.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ESCB203.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/ESCB203.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.enviroScienceCenter,
            roomType: 'Workshop',
            roomCapacity: '40',
            centerCode: 'ESC',
            reviewImageAssetPath: 'assets/images/review/ESCB203.jpg',
            hDImageAssetPath: 'assets/images/720/ESCB203.jpg',
            fHDImageAssetPath: 'assets/images/1080/ESCB203.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'A205',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'Keep walking straight towards the entrance of the Environmental Science Center.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'On entering the hallway of the building your room will be on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Environmental Science Center - Education Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ESCA205.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ESCA205.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/ESCA205.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.enviroScienceCenter,
            roomType: 'Education Lab',
            roomCapacity: 'N/A',
            centerCode: 'ESC',
            reviewImageAssetPath: 'assets/images/review/ESCA205.jpg',
            hDImageAssetPath: 'assets/images/720/ESCA205.jpg',
            fHDImageAssetPath: 'assets/images/1080/ESCA205.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'A209',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'Keep walking straight towards the entrance of the Environmental Science Center.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'On entering the hallway of the building your room will be on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Environmental Science Center - Education Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ESC209.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ESC209.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/ESC209.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.enviroScienceCenter,
            roomType: 'Education Lab',
            roomCapacity: 'N/A',
            centerCode: 'ESC',
            reviewImageAssetPath: 'assets/images/review/ESCA209.jpg',
            hDImageAssetPath: 'assets/images/720/ESCA209.jpg',
            fHDImageAssetPath: 'assets/images/1080/ESCA209.jpg',
          ),
        ],
      ),
      TrentFloorModel(
        floorNumber: '3',
        floorName: '3rd Floor',
        floorCenter: TrentCenters.enviroScienceCenter,
        expansionTileController: ExpansionTileController(),
        rooms: const <TrentRoomModel?>[
          TrentRoomModel(
            roomNumber: 'B305',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'Keep walking straight towards the entrance of the Environmental Science Center.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'On entering the building, walk straight down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Keep walking towards the hallway exit.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Walk down the hallway to the stairway door.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience3.5.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience3.5.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience3.5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Open the door to the stairway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience16.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience16.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience16.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Walk up the stairway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience17.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience17.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience17.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Exit this door (the only option).',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience18.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience18.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'On exiting the stairway, turn right and walk down the hallway. Your room will be up ahead on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience19.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience19.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'Environmental Science Center - Seminar Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ESCB305.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ESCB305.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/ESCB305.jpg',
                ),
              ],
            ),
            roomFloor: '3rd Floor',
            roomCenter: TrentCenters.enviroScienceCenter,
            roomType: 'Seminar Room',
            roomCapacity: '25',
            centerCode: 'ESC',
            reviewImageAssetPath: 'assets/images/review/ESCB305.jpg',
            hDImageAssetPath: 'assets/images/720/ESCB305.jpg',
            fHDImageAssetPath: 'assets/images/1080/ESCB305.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'B305.1',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'Keep walking straight towards the entrance of the Environmental Science Center.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'On entering the building, walk straight down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Keep walking towards the hallway exit.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Walk down the hallway to the stairway door.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience3.5.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience3.5.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience3.5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Open the door to the stairway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience16.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience16.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience16.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Walk up the stairway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience17.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience17.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience17.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Exit this door (the only option).',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience18.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience18.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'On exiting the stairway, turn right and walk down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience19.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience19.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience19.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'Keep walking towards the rooftop entrance on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience27.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience27.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience27.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Walk straight ahead to the rooftop door.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience28.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience28.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience28.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Look to your left, you are at the rooftop garden!',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience29.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience29.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience29.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Rooftop Gardens - B305.1',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience30.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience30.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience30.jpg',
                ),
              ],
            ),
            roomFloor: '3rd Floor',
            roomCenter: TrentCenters.enviroScienceCenter,
            roomType: 'Rooftop Gardens',
            roomCapacity: 'N/A',
            centerCode: 'ESC',
            reviewImageAssetPath: 'assets/images/review/enviroscience30.jpg',
            hDImageAssetPath: 'assets/images/720/enviroscience30.jpg',
            fHDImageAssetPath: 'assets/images/1080/enviroscience30.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'B319',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Towards the end of the pathway enter the Science Complex doors to your left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoscience2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoscience2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoscience2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'On entering the building, stay to your left and open the door to the stairway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoscience7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoscience7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoscience7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Walk upstairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience21.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience21.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience21.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Exit the stairway on the next floor (3rd floor).',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience22.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience22.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience22.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'On exiting the stairway, walk down the hallway and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience23.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience23.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience23.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Walk straight down the next hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience25.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience25.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience25.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Walk throught the hallway doors, your room will be on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience26.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience26.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience26.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription:
                      'Environmental Science Center - Geography Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ESCB319.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ESCB319.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/ESCB319.jpg',
                ),
              ],
            ),
            roomFloor: '3rd Floor',
            roomCenter: TrentCenters.enviroScienceCenter,
            roomType: 'Workshop',
            roomCapacity: '40',
            centerCode: 'ESC',
            reviewImageAssetPath: 'assets/images/review/ESCB319.jpg',
            hDImageAssetPath: 'assets/images/720/ESCB319.jpg',
            fHDImageAssetPath: 'assets/images/1080/ESCB319.jpg',
          ),
        ],
      ),
    ],
  ),
  TrentCenterModel(
    trentCenterName: 'Gzowski College',
    trentCenterCode: 'FPHL',
    otherTrentCenterCodes: <String?>[
      'GCS',
    ],
    trentCenter: TrentCenters.gzowskiCollege,
    reviewImageAssetPath: 'assets/images/review/GCS_Center.jpg',
    hDImageAssetPath: 'assets/images/720/GCS_Center.jpg',
    expansionTileController: ExpansionTileController(),
    trentCenterFloors: <TrentFloorModel?>[
      TrentFloorModel(
        floorNumber: '1',
        floorName: '1st Floor',
        floorCenter: TrentCenters.gzowskiCollege,
        expansionTileController: ExpansionTileController(),
        rooms: const <TrentRoomModel?>[
          TrentRoomModel(
            roomNumber: '101',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Follow the pathway to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk straight down the pathway towards Gzowski College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Enter the doors to the main Gzowski College entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'After entering the building, walk downstairs to the first floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'After reaching the first floor, walk straight down the hallway on your left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding5.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding5.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription:
                      'Take a left turn and walk down the hallway to the very end, your room will be on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding8.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding8.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding8.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription: 'Gzowski College - Performance Space',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/FPHL101.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/FPHL101.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/FPHL101.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.gzowskiCollege,
            roomType: 'Performance Space',
            roomCapacity: '80',
            centerCode: 'FPHL',
            reviewImageAssetPath: 'assets/images/review/FPHL101.jpg',
            hDImageAssetPath: 'assets/images/720/FPHL101.jpg',
            fHDImageAssetPath: 'assets/images/1080/FPHL101.jpg',
          ),
          TrentRoomModel(
            roomNumber: '103',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata1.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata1.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you are leaving the bridge stay to the left and walk down the steps.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'Walk straight and take a right turn down the steps up ahead.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata4.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata4.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Walk down the steps towards the library doors below on your left.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata5.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata5.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Enter the library and take a left turn down the hallway up ahead.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata6.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata6.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Walk straight down the hallway towards the doors up ahead and enter the hallway.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata7.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk straight down the hallway on the right. Your room will be at the end of the hallway on your right.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata9.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata9.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata9.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Bata Library - Film Theatre',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata103.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata103.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata103.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.gzowskiCollege,
            roomType: 'Classroom',
            roomCapacity: '50',
            centerCode: 'GCS',
            reviewImageAssetPath: 'assets/images/review/GCS103-2.jpg',
            hDImageAssetPath: 'assets/images/720/GCS103-2.jpg',
            fHDImageAssetPath: 'assets/images/1080/GCS103-2.jpg',
          ),
          TrentRoomModel(
            roomNumber: '105',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Follow the pathway to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk straight down the pathway towards Gzowski College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Enter the doors to the main Gzowski College entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'After entering the building, walk downstairs to the first floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'After reaching the first floor, walk straight down the hallway on your left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding5.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding5.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription:
                      'Take a left turn and walk down the hallway, your room will be up on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding8.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding8.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding8.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription: 'Gzowski College - Classroom',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/GCS105-2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/GCS105-2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/GCS105-2.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.gzowskiCollege,
            roomType: 'Classroom',
            roomCapacity: '40',
            centerCode: 'GCS',
            reviewImageAssetPath: 'assets/images/review/GCS105-3.jpg',
            hDImageAssetPath: 'assets/images/720/GCS105-3.jpg',
            fHDImageAssetPath: 'assets/images/1080/GCS105-3.jpg',
          ),
          TrentRoomModel(
            roomNumber: '106',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Follow the pathway to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk straight down the pathway towards Gzowski College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Enter the doors to the main Gzowski College entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'After entering the building, walk downstairs to the first floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'After reaching the first floor, walk straight down the hallway on your left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding5.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding5.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription:
                      'Take a left turn and walk down the hallway, your room will be up on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding8.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding8.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding8.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription: 'Gzowski College - Classroom',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/GCS106-3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/GCS106-3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/GCS106-3.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.gzowskiCollege,
            roomType: 'Classroom',
            roomCapacity: '50',
            centerCode: 'GCS',
            reviewImageAssetPath: 'assets/images/review/GCS106-3.jpg',
            hDImageAssetPath: 'assets/images/720/GCS106-3.jpg',
            fHDImageAssetPath: 'assets/images/1080/GCS106-3.jpg',
          ),
          TrentRoomModel(
            roomNumber: '108',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Follow the pathway to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk straight down the pathway towards Gzowski College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Enter the doors to the main Gzowski College entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'After entering the building, walk downstairs to the first floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'After reaching the first floor, walk straight down the hallway on your left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding5.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding5.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription:
                      'Take a left turn down the hallway, your room doors are on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription: 'Gzowski College - Classroom',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/GCS108-3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/GCS108-3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/GCS108-3.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.gzowskiCollege,
            roomType: 'Classroom',
            roomCapacity: '50',
            centerCode: 'GCS',
            reviewImageAssetPath: 'assets/images/review/GCS108-3.jpg',
            hDImageAssetPath: 'assets/images/720/GCS108-3.jpg',
            fHDImageAssetPath: 'assets/images/1080/GCS108-3.jpg',
          ),
          TrentRoomModel(
            roomNumber: '110',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Follow the pathway to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk straight down the pathway towards Gzowski College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Enter the doors to the main Gzowski College entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'After entering the building, walk downstairs to the first floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'Once reaching the first floor, walk down the hallway to your right. Your room will be on the right at the end of the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Gzowski College - Classroom',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/GCS110-2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/GCS110-2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/GCS110-2.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.gzowskiCollege,
            roomType: 'Classroom',
            roomCapacity: '30',
            centerCode: 'GCS',
            reviewImageAssetPath: 'assets/images/review/GCS110-2.jpg',
            hDImageAssetPath: 'assets/images/720/GCS110-2.jpg',
            fHDImageAssetPath: 'assets/images/1080/GCS110-2.jpg',
          ),
          TrentRoomModel(
            roomNumber: '111',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Follow the pathway to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk straight down the pathway towards Gzowski College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Enter the doors to the main Gzowski College entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'After entering the building, walk downstairs to the first floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'Once reaching the first floor, walk down the hallway to your right. Your room will be on the right at the end of the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Gzowski College - Classroom',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/GCS111-2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/GCS111-2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/GCS111-2.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.gzowskiCollege,
            roomType: 'Classroom',
            roomCapacity: '30',
            centerCode: 'GCS',
            reviewImageAssetPath: 'assets/images/review/GCS111-2.jpg',
            hDImageAssetPath: 'assets/images/720/GCS111-2.jpg',
            fHDImageAssetPath: 'assets/images/1080/GCS111-2.jpg',
          ),
          TrentRoomModel(
            roomNumber: '112',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Follow the pathway to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk straight down the pathway towards Gzowski College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Enter the doors to the main Gzowski College entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'After entering the building, walk downstairs to the first floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'Once reaching the first floor, the room will be on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Gzowski College - Classroom',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/GCS112-2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/GCS112-2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/GCS112-2.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.gzowskiCollege,
            roomType: 'Classroom',
            roomCapacity: '40',
            centerCode: 'GCS',
            reviewImageAssetPath: 'assets/images/review/GCS112-2.jpg',
            hDImageAssetPath: 'assets/images/720/GCS112-2.jpg',
            fHDImageAssetPath: 'assets/images/1080/GCS112-2.jpg',
          ),
          TrentRoomModel(
            roomNumber: '114',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Follow the pathway to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk straight down the pathway towards Gzowski College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Enter the doors to the main Gzowski College entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'After entering the building, walk downstairs to the first floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'On exiting the staircase take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription:
                      'Walk down the hallway, your room will be on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding14.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding14.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding14.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription: 'Gzowski College - Lecture Hall',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/GCS114.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/GCS114.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/GCS114.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.gzowskiCollege,
            roomType: 'Lecture Hall',
            roomCapacity: '230',
            centerCode: 'GCS',
            reviewImageAssetPath: 'assets/images/review/GCS114.jpg',
            hDImageAssetPath: 'assets/images/720/GCS114.jpg',
            fHDImageAssetPath: 'assets/images/1080/GCS114.jpg',
          ),
          TrentRoomModel(
            roomNumber: '115',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Follow the pathway to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk straight down the pathway towards Gzowski College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Enter the doors to the main Gzowski College entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'After entering the building, walk downstairs to the first floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'On exiting the staircase take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription:
                      'Walk down the hallway to the end, the room will be on your left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding16.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding16.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding16.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription: 'Gzowski College - Case Study Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/GCS115.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/GCS115.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/GCS115.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.gzowskiCollege,
            roomType: 'Case Study Room',
            roomCapacity: '62',
            centerCode: 'GCS',
            reviewImageAssetPath: 'assets/images/review/GCS115.jpg',
            hDImageAssetPath: 'assets/images/720/GCS115.jpg',
            fHDImageAssetPath: 'assets/images/1080/GCS115.jpg',
          ),
          TrentRoomModel(
            roomNumber: '117',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Follow the pathway to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk straight down the pathway towards Gzowski College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Enter the doors to the main Gzowski College entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'After entering the building, walk downstairs to the first floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'On exiting the staircase take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription:
                      'Walk straight down the hallway towards your room.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding15.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding15.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding15.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription: 'Gzowski College - Lecture Hall',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/FPHL117.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/FPHL117.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/FPHL117.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.gzowskiCollege,
            roomType: 'Lecture Hall',
            roomCapacity: '130',
            centerCode: 'FPHL',
            reviewImageAssetPath: 'assets/images/review/FPHL117.jpg',
            hDImageAssetPath: 'assets/images/720/FPHL117.jpg',
            fHDImageAssetPath: 'assets/images/1080/FPHL117.jpg',
          ),
        ],
      ),
      TrentFloorModel(
        floorNumber: '3',
        floorName: '3rd Floor',
        floorCenter: TrentCenters.gzowskiCollege,
        expansionTileController: ExpansionTileController(),
        rooms: const <TrentRoomModel?>[
          TrentRoomModel(
            roomNumber: '345',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Follow the pathway to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk straight down the pathway towards Gzowski College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Enter the doors to the main Gzowski College entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'After entering the building, walk upstairs to the third floor. The room is up ahead to your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding10.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding10.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding10.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Gzowski College - Seminar Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/GCS345.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/GCS345.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/GCS345.jpg',
                ),
              ],
            ),
            roomFloor: '3rd Floor',
            roomCenter: TrentCenters.gzowskiCollege,
            roomType: 'Seminar Room',
            roomCapacity: '20',
            centerCode: 'GCS',
            reviewImageAssetPath: 'assets/images/review/GCS345.jpg',
            hDImageAssetPath: 'assets/images/720/GCS345.jpg',
            fHDImageAssetPath: 'assets/images/1080/GCS345.jpg',
          ),
        ],
      ),
    ],
  ),
  TrentCenterModel(
    trentCenterName: 'Otonabee College',
    trentCenterCode: 'OCA',
    trentCenter: TrentCenters.otonabeeCollege,
    reviewImageAssetPath: 'assets/images/review/OCA_Center.jpg',
    hDImageAssetPath: 'assets/images/720/OCA_Center.jpg',
    expansionTileController: ExpansionTileController(),
    trentCenterFloors: <TrentFloorModel?>[
      TrentFloorModel(
        floorNumber: '1',
        floorName: '1st Floor',
        floorCenter: TrentCenters.otonabeeCollege,
        expansionTileController: ExpansionTileController(),
        rooms: const <TrentRoomModel?>[
          TrentRoomModel(
            roomNumber: 'W101.2',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'As you reach the end of the pathway take a right turn towards the Otonabee College Entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk towards the entrance door and enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk straight ahead down the hallway. The room will be up on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee13.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription: 'Otonabee College - Wenjack Theatre',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/OCAW101.2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/OCAW101.2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/OCAW101.2.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.otonabeeCollege,
            roomType: 'Wenjack Theatre',
            roomCapacity: '380',
            centerCode: 'OCA',
            reviewImageAssetPath: 'assets/images/review/OCW101.2.jpg',
            hDImageAssetPath: 'assets/images/720/OCW101.2.jpg',
            fHDImageAssetPath: 'assets/images/1080/OCW101.2.jpg',
          ),
          TrentRoomModel(
            roomNumber: '109',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'As you reach the end of the pathway take a right turn towards the Otonabee College Entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk towards the entrance door and enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Walk straight ahead down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee13.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Go up the steps and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee14.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee14.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee14.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'Walk down the hallway towards the staircase on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee17.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee17.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee17.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Head downstairs to the first floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee4.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Go down to the end of the hallway and take a left turn. Walk to the end of that hallway and the room will be on your left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee6.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Otonabee College - Workshop',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/OCA109.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/OCA109.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/OCA109.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.otonabeeCollege,
            roomType: 'Education Room',
            roomCapacity: '40',
            centerCode: 'OCA',
            reviewImageAssetPath: 'assets/images/review/OCA109.jpg',
            hDImageAssetPath: 'assets/images/720/OCA109.jpg',
            fHDImageAssetPath: 'assets/images/1080/OCA109.jpg',
          ),
          TrentRoomModel(
            roomNumber: '128',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'As you reach the end of the pathway take a right turn towards the Otonabee College Entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk towards the entrance door and enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Walk straight ahead down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee13.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Go up the steps and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee14.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee14.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee14.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'Walk down the hallway towards the staircase on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee17.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee17.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee17.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Head downstairs to the first floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee4.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Go down the hallway and take a right turn. Your room will be to your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee5.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee5.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Otonabee College - Seminar Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/OCA128.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/OCA128.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/OCA128.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.otonabeeCollege,
            roomType: 'Education Room',
            roomCapacity: '30',
            centerCode: 'OCA',
            reviewImageAssetPath: 'assets/images/review/OCA128.jpg',
            hDImageAssetPath: 'assets/images/720/OCA128.jpg',
            fHDImageAssetPath: 'assets/images/1080/OCA128.jpg',
          ),
          TrentRoomModel(
            roomNumber: '134',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'As you reach the end of the pathway take a right turn towards the Otonabee College Entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk towards the entrance door and enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Walk straight ahead down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee13.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Go up the steps and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee14.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee14.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee14.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'Walk down the hallway towards the staircase on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee17.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee17.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee17.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Head downstairs to the first floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee4.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Go down the hallway and take a right turn. Your room will be down that hallway to your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee5.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee5.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Otonabee College - Education Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/OCA134.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/OCA134.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/OCA134.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.otonabeeCollege,
            roomType: 'Education Room',
            roomCapacity: '40',
            centerCode: 'OCA',
            reviewImageAssetPath: 'assets/images/review/OCA134.jpg',
            hDImageAssetPath: 'assets/images/720/OCA134.jpg',
            fHDImageAssetPath: 'assets/images/1080/OCA134.jpg',
          ),
          TrentRoomModel(
            roomNumber: '143',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'As you reach the end of the pathway take a right turn towards the Otonabee College Entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk towards the entrance door and enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Walk straight ahead down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee13.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Go up the steps and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee14.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee14.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee14.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'Walk to the end on the hallway and take a left downstairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee15.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee15.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee15.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Walk downstairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee11.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee11.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Take a left turn at the bottom of the staircase. Your room will be straight ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Otonabee College - Education Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/OCA143.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/OCA143.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/OCA143.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.otonabeeCollege,
            roomType: 'Education Room',
            roomCapacity: '50',
            centerCode: 'OCA',
            reviewImageAssetPath: 'assets/images/review/OCA143.jpg',
            hDImageAssetPath: 'assets/images/720/OCA143.jpg',
            fHDImageAssetPath: 'assets/images/1080/OCA143.jpg',
          ),
          TrentRoomModel(
            roomNumber: '171',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'As you reach the end of the pathway take a right turn towards the Otonabee College Entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk towards the entrance door and enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Walk straight ahead down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee13.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Go up the steps and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee14.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee14.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee14.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'Walk to the end on the hallway and take a left downstairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee15.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee15.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee15.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Walk downstairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee11.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee11.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee11.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Take a right turn at the bottom of the stairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee24.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee24.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee24.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription:
                      'Walk through the hallways doors and continue walking down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee26.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee26.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee26.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '14',
                  stepDescription:
                      'Go to the end of of the hallway and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee27.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee27.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee27.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '15',
                  stepDescription:
                      'Walk straight down the hallway. Your room is at the very end.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee28.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee28.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee28.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '16',
                  stepDescription: 'Otonabee College - Sociology Resource Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/OCA171.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/OCA171.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/OCA171.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.otonabeeCollege,
            roomType: 'Sociology Resource Room',
            roomCapacity: '25',
            centerCode: 'OCA',
            reviewImageAssetPath: 'assets/images/review/OCA171.jpg',
            hDImageAssetPath: 'assets/images/720/OCA171.jpg',
            fHDImageAssetPath: 'assets/images/1080/OCA171.jpg',
          ),
        ],
      ),
      TrentFloorModel(
        floorNumber: '2',
        floorName: '2nd Floor',
        floorCenter: TrentCenters.otonabeeCollege,
        expansionTileController: ExpansionTileController(),
        rooms: const <TrentRoomModel?>[
          TrentRoomModel(
            roomNumber: '203',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'As you reach the end of the pathway take a right turn towards the Otonabee College Entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk towards the entrance door and enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Walk straight ahead down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee13.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Go up the steps and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee14.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee14.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee14.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'Walk down the hallway and midway down the hallway take a left turn up the steps. Your room will be just up the steps.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee16.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee16.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee16.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Otonabee College - Lecture Hall',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/OCA203.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/OCA203.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/OCA203.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.otonabeeCollege,
            roomType: 'Lecture Hall',
            roomCapacity: '140',
            centerCode: 'OCA',
            reviewImageAssetPath: 'assets/images/review/OCA203.jpg',
            hDImageAssetPath: 'assets/images/720/OCA203.jpg',
            fHDImageAssetPath: 'assets/images/1080/OCA203.jpg',
          ),
          TrentRoomModel(
            roomNumber: '204',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'As you reach the end of the pathway take a right turn towards the Otonabee College Entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk towards the entrance door and enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Walk straight ahead down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee13.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Go up the steps and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee14.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee14.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee14.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'Walk down the hallway and midway down the hallway take a left turn up the steps. Your room will straight ahead down the hall.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee16.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee16.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee16.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Otonabee College - Seminar Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/OCA204.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/OCA204.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/OCA204.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.otonabeeCollege,
            roomType: 'Seminar Room',
            roomCapacity: '30',
            centerCode: 'OCA',
            reviewImageAssetPath: 'assets/images/review/OCA204.jpg',
            hDImageAssetPath: 'assets/images/720/OCA204.jpg',
            fHDImageAssetPath: 'assets/images/1080/OCA204.jpg',
          ),
          TrentRoomModel(
            roomNumber: '205',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'As you reach the end of the pathway take a right turn towards the Otonabee College Entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk towards the entrance door and enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Walk straight ahead down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee13.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Go up the steps and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee14.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee14.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee14.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'Walk down the hallway and midway down the hallway take a left turn up the steps. Your room will up the steps and to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee16.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee16.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee16.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Otonabee College - Workshop',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/OCA205.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/OCA205.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/OCA205.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.otonabeeCollege,
            roomType: 'Workshop',
            roomCapacity: '74',
            centerCode: 'OCA',
            reviewImageAssetPath: 'assets/images/review/OCA205.jpg',
            hDImageAssetPath: 'assets/images/720/OCA205.jpg',
            fHDImageAssetPath: 'assets/images/1080/OCA205.jpg',
          ),
          TrentRoomModel(
            roomNumber: '206',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'As you reach the end of the pathway take a right turn towards the Otonabee College Entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk towards the entrance door and enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Walk straight ahead down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee13.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Go up the steps and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee14.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee14.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee14.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'Walk down the hallway and midway down the hallway take left turn up the steps. Your room will be just down the hall.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee16.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee16.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee16.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Otonabee College - Seminar Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/OCA206.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/OCA206.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/OCA206.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.otonabeeCollege,
            roomType: 'Seminar Room',
            roomCapacity: '30',
            centerCode: 'OCA',
            reviewImageAssetPath: 'assets/images/review/OCA206.jpg',
            hDImageAssetPath: 'assets/images/720/OCA206.jpg',
            fHDImageAssetPath: 'assets/images/1080/OCA206.jpg',
          ),
          TrentRoomModel(
            roomNumber: '207',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'As you reach the end of the pathway take a right turn towards the Otonabee College Entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk towards the entrance door and enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Walk straight ahead down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee13.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Go up the steps and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee14.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee14.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee14.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'Walk down the hallway and midway down the hallway take left turn up the steps. Your room will be just down the hall.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee16.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee16.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee16.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Otonabee College - Seminar Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/OCA207.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/OCA207.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/OCA207.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.otonabeeCollege,
            roomType: 'Seminar Room',
            roomCapacity: '30',
            centerCode: 'OCA',
            reviewImageAssetPath: 'assets/images/review/OCA207.jpg',
            hDImageAssetPath: 'assets/images/720/OCA207.jpg',
            fHDImageAssetPath: 'assets/images/1080/OCA207.jpg',
          ),
          TrentRoomModel(
            roomNumber: '208',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you are leaving the bridge stay to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'Keep walking straight towards Lady Eaton College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoladyeaton3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoladyeaton3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoladyeaton3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Continue walking towards Lady Eaton College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoladyeaton.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoladyeaton.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoladyeaton.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoladyeaton2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoladyeaton2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoladyeaton2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Walk down the hallway on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ladyeaton.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ladyeaton.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/ladyeaton.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Take a left turn at the end of the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ladyeaton13.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/ladyeaton13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/ladyeaton13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Take a right turn, your room will be just around the corner.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ladyeaton5.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ladyeaton5.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/ladyeaton5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription: 'Lady Eaton College - Seminar Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ECC208.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ECC208.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/ECC208.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.otonabeeCollege,
            roomType: 'Workshop',
            roomCapacity: '74',
            centerCode: 'OCA',
            reviewImageAssetPath: 'assets/images/review/OCA208.jpg',
            hDImageAssetPath: 'assets/images/720/OCA208.jpg',
            fHDImageAssetPath: 'assets/images/1080/OCA208.jpg',
          ),
          TrentRoomModel(
            roomNumber: '219',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'As you reach the end of the pathway take a right turn towards the Otonabee College Entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk towards the entrance door and enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Walk straight ahead down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee13.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Go up the steps and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee14.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee14.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee14.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'Walk to the end on the hallway and take a left downstairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee15.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee15.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee15.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription:
                      'Go up the stairs and take a right turn down the hallway. The room will be down the hallway on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee9.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee9.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee9.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription: 'Otonabee College - Computer Classroom',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/OCA219.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/OCA219.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/OCA219.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.otonabeeCollege,
            roomType: 'Computer Classroom',
            roomCapacity: '40',
            centerCode: 'OCA',
            reviewImageAssetPath: 'assets/images/review/OCA219.jpg',
            hDImageAssetPath: 'assets/images/720/OCA219.jpg',
            fHDImageAssetPath: 'assets/images/1080/OCA219.jpg',
          ),
        ],
      ),
    ],
  ),
  TrentCenterModel(
    trentCenterName: 'Science Complex',
    trentCenterCode: 'SC',
    trentCenter: TrentCenters.scienceComplex,
    reviewImageAssetPath: 'assets/images/review/SC_Center.jpg',
    hDImageAssetPath: 'assets/images/720/SC_Center.jpg',
    expansionTileController: ExpansionTileController(),
    trentCenterFloors: <TrentFloorModel?>[
      TrentFloorModel(
        floorNumber: '1',
        floorName: '1st Floor',
        floorCenter: TrentCenters.scienceComplex,
        expansionTileController: ExpansionTileController(),
        rooms: const <TrentRoomModel?>[
          TrentRoomModel(
            roomNumber: '103',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata1.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata1.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you are leaving the bridge stay to the left and walk down the steps.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'Walk straight and take a right turn down the steps up ahead.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata4.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata4.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Walk down the steps towards the library doors below on your left.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata5.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata5.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Enter the library and take a left turn down the hallway up ahead.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata6.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata6.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Walk straight down the hallway towards the doors up ahead and enter the hallway.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata7.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk straight down the hallway on the right. Your room will be at the end of the hallway on your right.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata9.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata9.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata9.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Bata Library - Film Theatre',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata103.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata103.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata103.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.scienceComplex,
            roomType: 'Classroom',
            roomCapacity: '60',
            centerCode: 'SC',
            reviewImageAssetPath: 'assets/images/review/SC103-2.jpg',
            hDImageAssetPath: 'assets/images/720/SC103-2.jpg',
            fHDImageAssetPath: 'assets/images/1080/SC103-2.jpg',
          ),
          TrentRoomModel(
            roomNumber: '115',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Follow the pathway to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk straight down the pathway towards Gzowski College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Enter the doors to the main Gzowski College entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'After entering the building, walk downstairs to the first floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'On exiting the staircase take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription:
                      'Walk down the hallway to the end, the room will be on your left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding16.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding16.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding16.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription: 'Gzowski College - Case Study Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/GCS115.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/GCS115.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/GCS115.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.scienceComplex,
            roomType: 'Classroom',
            roomCapacity: '60',
            centerCode: 'SC',
            reviewImageAssetPath: 'assets/images/review/SC115.jpg',
            hDImageAssetPath: 'assets/images/720/SC115.jpg',
            fHDImageAssetPath: 'assets/images/1080/SC115.jpg',
          ),
          TrentRoomModel(
            roomNumber: '137',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Walk down the pathway and take a right turn up ahead.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoscience.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoscience.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoscience.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Walk straight down the pathway and a take a left turn up ahead towards the Otonabee College building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee8.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee8.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee8.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk towards the Science Complex entrance and enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee9.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee9.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee9.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'On entering the building your room will be the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee27-1.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/otanabee27-1.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee27-1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription: 'Science Complex - Lecture Hall',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/SC137-2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/SC137-2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/SC137-2.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.scienceComplex,
            roomType: 'Lecture Hall',
            roomCapacity: '265',
            centerCode: 'SC',
            reviewImageAssetPath: 'assets/images/review/SC137-2.jpg',
            hDImageAssetPath: 'assets/images/720/SC137-2.jpg',
            fHDImageAssetPath: 'assets/images/1080/SC137-2.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'W1',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'As you reach the end of the pathway take a right turn towards the Otonabee College Entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk towards the entrance door and enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'After entering the building, walk straight down the hallway on your right and take a left turn through the next set of hallway doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Walk down the steps towards your room door.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee23.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee23.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee23.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Science Complex - Seminar Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/SCW1W2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/SCW1W2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/SCW1W2.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.scienceComplex,
            roomType: 'Seminar Room',
            roomCapacity: '25',
            centerCode: 'SC',
            reviewImageAssetPath: 'assets/images/review/SCW1W2.jpg',
            hDImageAssetPath: 'assets/images/720/SCW1W2.jpg',
            fHDImageAssetPath: 'assets/images/1080/SCW1W2.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'W2',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'As you reach the end of the pathway take a right turn towards the Otonabee College Entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk towards the entrance door and enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'After entering the building, walk straight down the hallway on your right and take a left turn through the next set of hallway doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Walk down the steps towards your room door.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee23.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee23.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee23.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Science Complex - Seminar Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/SCW1W2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/SCW1W2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/SCW1W2.jpg',
                ),
              ],
            ),
            roomFloor: '1st Floor',
            roomCenter: TrentCenters.scienceComplex,
            roomType: 'Seminar Room',
            roomCapacity: '25',
            centerCode: 'SC',
            reviewImageAssetPath: 'assets/images/review/SCW1W2.jpg',
            hDImageAssetPath: 'assets/images/720/SCW1W2.jpg',
            fHDImageAssetPath: 'assets/images/1080/SCW1W2.jpg',
          ),
        ],
      ),
      TrentFloorModel(
        floorNumber: '2',
        floorName: '2nd Floor',
        floorCenter: TrentCenters.scienceComplex,
        expansionTileController: ExpansionTileController(),
        rooms: const <TrentRoomModel?>[
          TrentRoomModel(
            roomNumber: '203',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'As you reach the end of the pathway take a right turn towards the Otonabee College Entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk towards the entrance door and enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Walk straight ahead down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee13.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Go up the steps and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee14.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee14.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee14.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'Walk down the hallway and midway down the hallway take a left turn up the steps. Your room will be just up the steps.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee16.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee16.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee16.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Otonabee College - Lecture Hall',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/OCA203.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/OCA203.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/OCA203.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.scienceComplex,
            roomType: 'Classroom',
            roomCapacity: '60',
            centerCode: 'SC',
            reviewImageAssetPath: 'assets/images/review/SC203.jpg',
            hDImageAssetPath: 'assets/images/720/SC203.jpg',
            fHDImageAssetPath: 'assets/images/1080/SC203.jpg',
          ),
          TrentRoomModel(
            roomNumber: '208',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you are leaving the bridge stay to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'Keep walking straight towards Lady Eaton College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoladyeaton3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoladyeaton3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoladyeaton3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Continue walking towards Lady Eaton College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoladyeaton.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoladyeaton.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoladyeaton.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoladyeaton2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoladyeaton2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoladyeaton2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Walk down the hallway on your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ladyeaton.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ladyeaton.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/ladyeaton.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Take a left turn at the end of the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ladyeaton13.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/ladyeaton13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/ladyeaton13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Take a right turn, your room will be just around the corner.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ladyeaton5.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ladyeaton5.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/ladyeaton5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription: 'Lady Eaton College - Seminar Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/ECC208.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/ECC208.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/ECC208.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.scienceComplex,
            roomType: 'Seminar Room',
            roomCapacity: '30',
            centerCode: 'SC',
            reviewImageAssetPath: 'assets/images/review/SC208.jpg',
            hDImageAssetPath: 'assets/images/720/SC208.jpg',
            fHDImageAssetPath: 'assets/images/1080/SC208.jpg',
          ),
          TrentRoomModel(
            roomNumber: '215',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Walk towards the Science Complex entrance doors and enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoscience3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoscience3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoscience3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk to the end of the hallway and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/sciencecomplex.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/sciencecomplex.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/sciencecomplex.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Walk straight throught the hallway doors, the class is on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/sciencecomplex2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/sciencecomplex2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/sciencecomplex2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription: 'Science Complex - Classroom',
                  stepSmallImageAssetPath: 'assets/images/find/small/SC215.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/SC215.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/SC215.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.scienceComplex,
            roomType: 'Classroom',
            roomCapacity: '60',
            centerCode: 'SC',
            reviewImageAssetPath: 'assets/images/review/SC215.jpg',
            hDImageAssetPath: 'assets/images/720/SC215.jpg',
            fHDImageAssetPath: 'assets/images/1080/SC215.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'W3',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'As you reach the end of the pathway take a right turn towards the Otonabee College Entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk towards the entrance door and enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'After entering the building, walk straight down the hallway on your right and take a left turn through the next set of hallway doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Walk upstairs, your room will be at the top of the steps.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee12.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee12.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee12.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Science Complex - Seminar Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/SCW3W4.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/SCW3W4.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/SCW3W4.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.scienceComplex,
            roomType: 'Seminar Room',
            roomCapacity: '25',
            centerCode: 'SC',
            reviewImageAssetPath: 'assets/images/review/SCW3W4.jpg',
            hDImageAssetPath: 'assets/images/720/SCW3W4.jpg',
            fHDImageAssetPath: 'assets/images/1080/SCW3W4.jpg',
          ),
          TrentRoomModel(
            roomNumber: 'W4',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'As you reach the end of the pathway take a right turn towards the Otonabee College Entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk towards the entrance door and enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'After entering the building, walk straight down the hallway on your right and take a left turn through the next set of hallway doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Walk upstairs, your room will be at the top of the steps.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee12.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee12.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee12.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Science Complex - Seminar Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/SCW3W4.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/SCW3W4.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/SCW3W4.jpg',
                ),
              ],
            ),
            roomFloor: '2nd Floor',
            roomCenter: TrentCenters.scienceComplex,
            roomType: 'Seminar Room',
            roomCapacity: '25',
            centerCode: 'SC',
            reviewImageAssetPath: 'assets/images/review/SCW3W4.jpg',
            hDImageAssetPath: 'assets/images/720/SCW3W4.jpg',
            fHDImageAssetPath: 'assets/images/1080/SCW3W4.jpg',
          ),
        ],
      ),
      TrentFloorModel(
        floorNumber: '3',
        floorName: '3rd Floor',
        floorCenter: TrentCenters.scienceComplex,
        expansionTileController: ExpansionTileController(),
        rooms: const <TrentRoomModel?>[
          TrentRoomModel(
            roomNumber: '305',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Towards the end of the pathway enter the Science Complex doors to your left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoscience2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoscience2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoscience2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'On entering the building, stay to your left and open the door to the stairway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoscience7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoscience7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoscience7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Walk upstairs.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience21.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience21.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience21.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Exit the stairway on the next floor (3rd floor). Your room will be out the doors and to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/enviroscience22.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/enviroscience22.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/enviroscience22.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Science Complex - Physics Lab',
                  stepSmallImageAssetPath: 'assets/images/find/small/SC305.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/SC305.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/SC305.jpg',
                ),
              ],
            ),
            roomFloor: '3rd Floor',
            roomCenter: TrentCenters.scienceComplex,
            roomType: 'Physics Lab',
            roomCapacity: 'N/A',
            centerCode: 'SC',
            reviewImageAssetPath: 'assets/images/review/SC305.jpg',
            hDImageAssetPath: 'assets/images/720/SC305.jpg',
            fHDImageAssetPath: 'assets/images/1080/SC305.jpg',
          ),
          TrentRoomModel(
            roomNumber: '317',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Walk towards the Science Complex entrance doors and enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoscience3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoscience3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoscience3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk to the end of the hallway and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/sciencecomplex.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/sciencecomplex.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/sciencecomplex.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Go through the hallway doors and take a right turn towards the staircase.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/sciencecomplex27.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/sciencecomplex27.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/sciencecomplex27.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription: 'Open the door to the staircaise.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/sciencecomplex7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/sciencecomplex7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/sciencecomplex7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription: 'Walk up the staircase to the third floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/sciencecomplex16.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/sciencecomplex16.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/sciencecomplex16.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Exit the staircase through these doors.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/sciencecomplex17.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/sciencecomplex17.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/sciencecomplex17.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Walk up the steps, your room is on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/sciencecomplex18.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/sciencecomplex18.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/sciencecomplex18.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Science Complex - Physics Lab',
                  stepSmallImageAssetPath: 'assets/images/find/small/SC317.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/SC317.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/SC317.jpg',
                ),
              ],
            ),
            roomFloor: '3rd Floor',
            roomCenter: TrentCenters.scienceComplex,
            roomType: 'Physics Lab',
            roomCapacity: 'N/A',
            centerCode: 'SC',
            reviewImageAssetPath: 'assets/images/review/SC317.jpg',
            hDImageAssetPath: 'assets/images/720/SC317.jpg',
            fHDImageAssetPath: 'assets/images/1080/SC317.jpg',
          ),
        ],
      ),
    ],
  ),
  TrentCenterModel(
    trentCenterName: 'Traill Campus',
    trentCenterCode: 'CH',
    reviewImageAssetPath: 'assets/images/review/Traill_Center.jpg',
    hDImageAssetPath: 'assets/images/720/Traill_Center.jpg',
    expansionTileController: ExpansionTileController(),
    otherTrentCenterCodes: <String?>[
      'SH',
      'TC',
      'WH',
      'BG',
    ],
    trentCenter: TrentCenters.traillCampus,
    trentCenterFloors: <TrentFloorModel?>[
      TrentFloorModel(
        floorNumber: '1',
        floorName: 'All Floors',
        floorCenter: TrentCenters.traillCampus,
        expansionTileController: ExpansionTileController(),
        rooms: const <TrentRoomModel?>[
          TrentRoomModel(
            roomNumber: '102',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata1.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata1.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you are leaving the bridge stay to the left and walk down the steps.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'Walk straight and take a right turn down the steps up ahead.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata4.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata4.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Walk down the steps towards the library doors below on your left.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata5.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata5.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Enter the library and take a left turn down the hallway up ahead.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata6.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata6.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Walk straight down the hallway towards the doors up ahead. Your room will be the first room straight ahead as you enter the hallway.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata7.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Bata Library - Language Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata102.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata102.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata102.jpg',
                ),
              ],
            ),
            roomFloor: 'All Floors',
            roomCenter: TrentCenters.traillCampus,
            roomType: 'Seminar Room',
            roomCapacity: '20',
            centerCode: 'CH',
            reviewImageAssetPath: 'assets/images/review/CH102.jpg',
            hDImageAssetPath: 'assets/images/720/CH102.jpg',
            fHDImageAssetPath: 'assets/images/1080/CH102.jpg',
          ),
          TrentRoomModel(
            roomNumber: '102.1',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription: 'Map from Symons Campus to Traill College',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/trailmap.jpg',
                  stepHDImageAssetPath: 'assets/images/find/small/trailmap.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/small/trailmap.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription: 'Traill College Campus',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/traill.jpg',
                  stepHDImageAssetPath: 'assets/images/find/small/traill.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/small/traill.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Scott House',
                  stepSmallImageAssetPath: 'assets/images/find/small/SC.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/SC.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/SC.jpg',
                ),
              ],
            ),
            roomFloor: 'All Floors',
            roomCenter: TrentCenters.traillCampus,
            roomType: 'Seminar Room',
            roomCapacity: '20',
            centerCode: 'SH',
            reviewImageAssetPath: 'assets/images/review/SC.jpg',
            hDImageAssetPath: 'assets/images/720/SC.jpg',
            fHDImageAssetPath: 'assets/images/1080/SC.jpg',
          ),
          TrentRoomModel(
            roomNumber: '105',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Follow the pathway to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk straight down the pathway towards Gzowski College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Enter the doors to the main Gzowski College entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'After entering the building, walk downstairs to the first floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'After reaching the first floor, walk straight down the hallway on your left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding5.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding5.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription:
                      'Take a left turn and walk down the hallway, your room will be up on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding8.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding8.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding8.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription: 'Gzowski College - Classroom',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/GCS105-2.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/GCS105-2.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/GCS105-2.jpg',
                ),
              ],
            ),
            roomFloor: 'All Floors',
            roomCenter: TrentCenters.traillCampus,
            roomType: 'Multi-Purpose Room',
            roomCapacity: '80',
            centerCode: 'SH',
            reviewImageAssetPath: 'assets/images/review/SC.jpg',
            hDImageAssetPath: 'assets/images/720/SC.jpg',
            fHDImageAssetPath: 'assets/images/1080/SC.jpg',
          ),
          TrentRoomModel(
            roomNumber: '101',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a right turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight ahead down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee6.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee6.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription: 'Follow the pathway to the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk straight down the pathway towards Gzowski College.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski4.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription:
                      'Enter the doors to the main Gzowski College entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetogzowski.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetogzowski.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetogzowski.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'After entering the building, walk downstairs to the first floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'After reaching the first floor, walk straight down the hallway on your left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding5.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding5.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription:
                      'Take a left turn and walk down the hallway to the very end, your room will be on the right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/gzowskibuilding8.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/gzowskibuilding8.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/gzowskibuilding8.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription: 'Gzowski College - Performance Space',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/FPHL101.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/FPHL101.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/FPHL101.jpg',
                ),
              ],
            ),
            roomFloor: 'All Floors',
            roomCenter: TrentCenters.traillCampus,
            roomType: 'Bagnani Hall',
            roomCapacity: '80',
            centerCode: 'BG',
            reviewImageAssetPath: 'assets/images/review/TC101.jpg',
            hDImageAssetPath: 'assets/images/720/TC101.jpg',
            fHDImageAssetPath: 'assets/images/1080/TC101.jpg',
          ),
          TrentRoomModel(
            roomNumber: '102',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to West Bank.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata1.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata1.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata1.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you are leaving the bridge stay to the left and walk down the steps.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription:
                      'Walk straight and take a right turn down the steps up ahead.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata4.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata4.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription:
                      'Walk down the steps towards the library doors below on your left.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata5.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata5.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription:
                      'Enter the library and take a left turn down the hallway up ahead.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata6.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata6.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata6.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'Walk straight down the hallway towards the doors up ahead. Your room will be the first room straight ahead as you enter the hallway.',
                  stepSmallImageAssetPath: 'assets/images/find/small/bata7.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata7.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription: 'Bata Library - Language Lab',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bata102.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bata102.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bata102.jpg',
                ),
              ],
            ),
            roomFloor: 'All Floors',
            roomCenter: TrentCenters.traillCampus,
            roomType: 'Seminar Room',
            roomCapacity: '25',
            centerCode: 'WH',
            reviewImageAssetPath: 'assets/images/review/WH.jpg',
            hDImageAssetPath: 'assets/images/720/WH.jpg',
            fHDImageAssetPath: 'assets/images/1080/WH.jpg',
          ),
          TrentRoomModel(
            roomNumber: '128',
            findRoomSteps: TrentRoomFindSteps(
              steps: <TrentRoomFindStep?>[
                TrentRoomFindStep(
                  stepNumber: '1',
                  stepDescription:
                      'Walk across the Faryon Bridge to East Bank.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetoenviro.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetoenviro.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetoenviro.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '2',
                  stepDescription:
                      'As you exit the bridge keep walking straight.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridge3.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/bridge3.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/bridge3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '3',
                  stepDescription: 'Walk down the steps and take a left turn.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '4',
                  stepDescription: 'Walk straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee3.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee3.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee3.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '5',
                  stepDescription: 'Keep walking straight down the pathway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetootanabee7.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetootanabee7.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetootanabee7.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '6',
                  stepDescription:
                      'As you reach the end of the pathway take a right turn towards the Otonabee College Entrance.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '7',
                  stepDescription:
                      'Walk towards the entrance door and enter the building.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/bridgetowenjack2.jpg',
                  stepHDImageAssetPath:
                      'assets/images/find/720/bridgetowenjack2.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/bridgetowenjack2.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '8',
                  stepDescription: 'Walk straight ahead down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee13.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee13.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee13.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '9',
                  stepDescription:
                      'Go up the steps and take a right turn down the hallway.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee14.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee14.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee14.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '10',
                  stepDescription:
                      'Walk down the hallway towards the staircase on the left.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee17.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee17.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee17.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '11',
                  stepDescription: 'Head downstairs to the first floor.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee4.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee4.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee4.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '12',
                  stepDescription:
                      'Go down the hallway and take a right turn. Your room will be to your right.',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/otanabee5.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/otanabee5.jpg',
                  stepFHDImageAssetPath:
                      'assets/images/find/1080/otanabee5.jpg',
                ),
                TrentRoomFindStep(
                  stepNumber: '13',
                  stepDescription: 'Otonabee College - Seminar Room',
                  stepSmallImageAssetPath:
                      'assets/images/find/small/OCA128.jpg',
                  stepHDImageAssetPath: 'assets/images/find/720/OCA128.jpg',
                  stepFHDImageAssetPath: 'assets/images/find/1080/OCA128.jpg',
                ),
              ],
            ),
            roomFloor: 'All Floors',
            roomCenter: TrentCenters.traillCampus,
            roomType: 'Seminar Room',
            roomCapacity: '20',
            centerCode: 'WH',
            reviewImageAssetPath: 'assets/images/review/WH.jpg',
            hDImageAssetPath: 'assets/images/720/WH.jpg',
            fHDImageAssetPath: 'assets/images/1080/WH.jpg',
          ),
        ],
      ),
    ],
  ),
];
