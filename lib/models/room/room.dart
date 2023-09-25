import 'package:trent_u_class_find/models/enums/enums.dart';

class TrentRoomModel {
  final String? roomNumber;
  final String? roomFloor;
  final String? roomType;
  final String? roomCapacity;

  final String? centerCode;

  final TrentCenters? roomCenter;

  final String? reviewImageAssetPath;
  final String? hDImageAssetPath;
  final String? fHDImageAssetPath;

  final String? findRoomData;

  const TrentRoomModel({
    required this.roomNumber,
    required this.roomFloor,
    required this.roomCenter,
    required this.roomType,
    required this.roomCapacity,
    required this.centerCode,
    required this.reviewImageAssetPath,
    required this.hDImageAssetPath,
    required this.fHDImageAssetPath,
    this.findRoomData,
  });
}
