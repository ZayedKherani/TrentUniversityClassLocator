import 'package:flutter/foundation.dart';

import 'package:trent_u_class_find/models/license/license.dart';

Future<List<LicensePackage?>?>? convertLicensesFuture(
  Future<List<LicenseEntry>?>? data,
) async {
  if (data == null) {
    return null;
  }

  return await convertLicenses(
    await data,
  );
}

Future<List<LicensePackage?>?>? convertLicenses(
  List<LicenseEntry?>? data,
) async {
  List<LicensePackage?> licenses = <LicensePackage?>[];

  if (data == null) {
    return null;
  }

  for (LicenseEntry? licenseEntry in data) {
    LicensePackage? licensePackageDirty;
    bool? isAdd;

    if (licenses.any(
      (
        LicensePackage? licensePackage,
      ) =>
          licensePackage!.packageName == licenseEntry!.packages.first,
    )) {
      licensePackageDirty = licenses.firstWhere(
        (
          LicensePackage? licensePackage,
        ) =>
            licensePackage!.packageName == licenseEntry!.packages.first,
      );

      await licensePackageDirty!.addPackageOccorrence();

      isAdd = false;
    } else {
      licensePackageDirty = LicensePackage(
        packageName: licenseEntry!.packages.first,
        packageOccorrences: licenseEntry.packages.length,
      );

      isAdd = true;
    }

    List<String?>? licenseParagraphsDirty = <String?>[];
    for (LicenseParagraph? licenseParagraph in licenseEntry!.paragraphs) {
      licenseParagraphsDirty.add(
        "${'    ' * (licenseParagraph!.indent)}${licenseParagraph.text}",
      );
    }

    licensePackageDirty.addParagraph(
      paragraphToAdd: licenseParagraphsDirty,
    );

    if (isAdd) {
      licenses.add(
        licensePackageDirty,
      );
    }
  }

  return licenses;
}
