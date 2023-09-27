import 'package:flutter/material.dart';
import 'package:trent_u_class_locator/models/enums/enums.dart';
import 'package:trent_u_class_locator/models/room/room.dart';

class TrentFloorModel {
  final String? floorNumber;
  final String? floorName;

  final TrentCenters? floorCenter;

  final List<TrentRoomModel?>? rooms;

  final ExpansionTileController? expansionTileController;

  const TrentFloorModel({
    required this.floorNumber,
    required this.floorCenter,
    required this.floorName,
    required this.rooms,
    required this.expansionTileController,
  });
}
