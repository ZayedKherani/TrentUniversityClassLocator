import 'package:flutter/material.dart';
import 'package:trent_u_class_locator/models/enums/enums.dart';
import 'package:trent_u_class_locator/models/floor/floor.dart';

class TrentCenterModel {
  final String? trentCenterName;

  final String? trentCenterCode;

  final TrentCenters? trentCenter;

  final List<TrentFloorModel?>? trentCenterFloors;

  final String? reviewImageAssetPath;
  final String? hDImageAssetPath;

  final ExpansionTileController? expansionTileController;
  // final ExpansionTileController? expansionTileController;

  final List<String?>? otherTrentCenterCodes;

  final String? mapData;

  const TrentCenterModel({
    required this.trentCenterName,
    required this.trentCenterCode,
    required this.trentCenterFloors,
    required this.trentCenter,
    required this.reviewImageAssetPath,
    required this.hDImageAssetPath,
    required this.expansionTileController,
    this.otherTrentCenterCodes,
    this.mapData,
  });
}
