class TrentCenterArguments {
  final int? centerIndex;

  const TrentCenterArguments({
    required this.centerIndex,
  });
}

class TrentFloorArguments {
  final int? centerIndex;
  final int? floorIndex;

  const TrentFloorArguments({
    required this.centerIndex,
    required this.floorIndex,
  });
}

class TrentRoomArguments {
  final int? centerIndex;
  final int? floorIndex;
  final int? roomIndex;

  const TrentRoomArguments({
    required this.centerIndex,
    required this.floorIndex,
    required this.roomIndex,
  });
}

class TrentAppSettingsLicensePageArguments {
  final String? applicationVersion;
  final String? applicationLegalese;
  final String? applicationName;
  final String? applicationIconAssetPath;

  const TrentAppSettingsLicensePageArguments({
    required this.applicationVersion,
    required this.applicationLegalese,
    required this.applicationName,
    required this.applicationIconAssetPath,
  });
}

class TrentAppSettingsLicensePackagePageArguments {
  final String? packageName;
  final String? packageOccorrences;

  final List<List<String?>?>? paragraphs;

  const TrentAppSettingsLicensePackagePageArguments({
    required this.packageName,
    required this.packageOccorrences,
    required this.paragraphs,
  });
}

class TrentFindArguments extends TrentRoomArguments {
  TrentFindArguments({
    required super.centerIndex,
    required super.floorIndex,
    required super.roomIndex,
  });
}
