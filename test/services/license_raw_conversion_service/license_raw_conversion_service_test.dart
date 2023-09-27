import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:trent_u_class_locator/models/license/license.dart';
import 'package:trent_u_class_locator/services/license_raw_conversion_service/license_raw_conversion_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group(
    'convertLicense',
    () {
      test(
        'null',
        () async {
          final List<LicensePackage?>? result = await convertLicenses(
            null,
          );

          expect(
            result,
            isNull,
          );

          expect(
            result,
            equals(
              null,
            ),
          );
        },
      );

      test(
        'empty',
        () async {
          List<LicenseEntry?>? data = <LicenseEntry?>[];

          final List<LicensePackage?>? result = await convertLicenses(
            data,
          );

          expect(
            result,
            isNotNull,
          );

          expect(
            result,
            isA<List<LicensePackage?>>(),
          );

          expect(
            result,
            equals(
              <LicensePackage?>[],
            ),
          );
        },
      );

      test(
        'One `LicenseEntry`',
        () async {
          List<LicenseEntry?>? data = <LicenseEntry?>[
            (await LicenseRegistry.licenses.toList()).first,
          ];

          final List<LicensePackage?>? result = await convertLicenses(
            data,
          );

          expect(
            result,
            isNotNull,
          );

          expect(
            result,
            isA<List<LicensePackage?>>(),
          );

          expect(
            result!.length,
            equals(
              <LicensePackage?>[
                LicensePackage(
                  packageName: data.first!.packages.first,
                  packageOccorrences: data.first!.packages.length,
                  paragraphs: <List<String?>?>[
                    () {
                      List<String?>? result = <String?>[];

                      for (final LicenseParagraph paragraph
                          in data.first!.paragraphs) {
                        result.add(
                          paragraph.text,
                        );
                      }

                      return result;
                    }(),
                  ],
                ),
              ].length,
            ),
          );

          expect(
            result.first!.packageName,
            equals(
              <LicensePackage?>[
                LicensePackage(
                  packageName: data.first!.packages.first,
                  packageOccorrences: data.first!.packages.length,
                  paragraphs: <List<String?>?>[
                    () {
                      List<String?>? result = <String?>[];

                      for (final LicenseParagraph paragraph
                          in data.first!.paragraphs) {
                        result.add(
                          paragraph.text,
                        );
                      }

                      return result;
                    }(),
                  ],
                ),
              ].first!.packageName,
            ),
          );

          expect(
            result.first!.packageOccorrences,
            equals(
              <LicensePackage?>[
                LicensePackage(
                  packageName: data.first!.packages.first,
                  packageOccorrences: data.first!.packages.length,
                  paragraphs: <List<String?>?>[
                    () {
                      List<String?>? result = <String?>[];

                      for (final LicenseParagraph paragraph
                          in data.first!.paragraphs) {
                        result.add(
                          paragraph.text,
                        );
                      }

                      return result;
                    }(),
                  ],
                ),
              ].first!.packageOccorrences,
            ),
          );

          expect(
            result.first!.paragraphs,
            equals(
              <LicensePackage?>[
                LicensePackage(
                  packageName: data.first!.packages.first,
                  packageOccorrences: data.first!.packages.length,
                  paragraphs: <List<String?>?>[
                    () {
                      List<String?>? result = <String?>[];

                      for (final LicenseParagraph paragraph
                          in data.first!.paragraphs) {
                        result.add(
                          "${'    ' * (paragraph.indent)}${paragraph.text}",
                        );
                      }

                      return result;
                    }(),
                  ],
                ),
              ].first!.paragraphs,
            ),
          );

          expect(
            result.first!.paragraphs!.length,
            equals(
              <LicensePackage?>[
                LicensePackage(
                  packageName: data.first!.packages.first,
                  packageOccorrences: data.first!.packages.length,
                  paragraphs: <List<String?>?>[
                    () {
                      List<String?>? result = <String?>[];

                      for (final LicenseParagraph paragraph
                          in data.first!.paragraphs) {
                        result.add(
                          "${'    ' * (paragraph.indent)}${paragraph.text}",
                        );
                      }

                      return result;
                    }(),
                  ],
                ),
              ].first!.paragraphs!.length,
            ),
          );
        },
      );

      test(
        'Multiple `LicenseEntry`',
        () async {
          List<LicenseEntry?>? data = await LicenseRegistry.licenses.toList();

          final List<LicensePackage?>? result = await convertLicenses(
            data,
          );

          expect(
            result,
            isNotNull,
          );

          expect(
            result,
            isNotEmpty,
          );

          expect(
            result,
            isA<List<LicensePackage?>>(),
          );

          List<LicensePackage?> licenses = <LicensePackage?>[];

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
            for (LicenseParagraph? licenseParagraph
                in licenseEntry!.paragraphs) {
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

          for (LicensePackage? licensePackage in licenses) {
            expect(
              result!.any(
                (
                  LicensePackage? licensePackageResult,
                ) =>
                    licensePackageResult!.packageName ==
                    licensePackage!.packageName,
              ),
              isTrue,
            );

            expect(
              result
                  .firstWhere(
                    (
                      LicensePackage? licensePackageResult,
                    ) =>
                        licensePackageResult!.packageName ==
                        licensePackage!.packageName,
                  )!
                  .packageName,
              equals(
                licensePackage!.packageName,
              ),
            );

            expect(
              result.any(
                (
                  LicensePackage? licensePackageResult,
                ) =>
                    licensePackageResult!.packageOccorrences ==
                    licensePackage.packageOccorrences,
              ),
              isTrue,
            );

            expect(
              result
                  .firstWhere(
                    (
                      LicensePackage? licensePackageResult,
                    ) =>
                        licensePackageResult!.packageOccorrences ==
                        licensePackage.packageOccorrences,
                  )!
                  .packageOccorrences,
              equals(
                licensePackage.packageOccorrences,
              ),
            );

            expect(
              result.any(
                (
                  LicensePackage? licensePackageResult,
                ) =>
                    licensePackageResult!.paragraphs!.length ==
                    licensePackage.paragraphs!.length,
              ),
              isTrue,
            );

            expect(
              result
                  .firstWhere(
                    (
                      LicensePackage? licensePackageResult,
                    ) =>
                        licensePackageResult!.paragraphs!.length ==
                        licensePackage.paragraphs!.length,
                  )!
                  .paragraphs!
                  .length,
              equals(
                licensePackage.paragraphs!.length,
              ),
            );

            bool? compareAgainstResult = () {
              for (LicensePackage? resultToIterate in result) {
                if (resultToIterate!.packageName !=
                    licensePackage.packageName) {
                  continue;
                }

                if (resultToIterate.paragraphs!.length !=
                    licensePackage.paragraphs!.length) {
                  return false;
                }

                for (int firstIterationIndex = 0;
                    firstIterationIndex < resultToIterate.paragraphs!.length;
                    firstIterationIndex++) {
                  if (resultToIterate.paragraphs![firstIterationIndex] ==
                          null &&
                      licensePackage.paragraphs![firstIterationIndex] == null) {
                    return true;
                  }

                  if (resultToIterate.paragraphs![firstIterationIndex] ==
                          null ||
                      licensePackage.paragraphs![firstIterationIndex] == null ||
                      resultToIterate
                              .paragraphs![firstIterationIndex]!.length !=
                          licensePackage
                              .paragraphs![firstIterationIndex]!.length) {
                    return false;
                  }

                  for (int secondIterationIndex = 0;
                      secondIterationIndex <
                          resultToIterate
                              .paragraphs![firstIterationIndex]!.length;
                      secondIterationIndex++) {
                    if (resultToIterate.paragraphs![firstIterationIndex]![
                            secondIterationIndex] !=
                        licensePackage.paragraphs![firstIterationIndex]![
                            secondIterationIndex]) {
                      return false;
                    }
                  }
                }

                return true;
              }
            }();

            expect(
              compareAgainstResult,
              equals(
                true,
              ),
            );
          }
        },
      );
    },
  );

  group(
    'convertLicensesFuture',
    () {
      test(
        'null',
        () async {
          final List<LicensePackage?>? result = await convertLicensesFuture(
            null,
          );

          expect(
            result,
            isNull,
          );

          expect(
            result,
            equals(
              null,
            ),
          );
        },
      );

      test(
        'empty',
        () async {
          Future<List<LicenseEntry>?>? data() async {
            return <LicenseEntry>[];
          }

          final List<LicensePackage?>? result = await convertLicensesFuture(
            data(),
          );

          expect(
            result,
            isNotNull,
          );

          expect(
            result,
            isA<List<LicensePackage?>>(),
          );

          expect(
            result,
            equals(
              <LicensePackage?>[],
            ),
          );
        },
      );

      test(
        'One `LicenseEntry`',
        () async {
          Future<List<LicenseEntry>?>? data() async {
            return <LicenseEntry>[
              (await LicenseRegistry.licenses.toList()).first,
            ];
          }

          final List<LicensePackage?>? result = await convertLicensesFuture(
            data(),
          );

          expect(
            result,
            isNotNull,
          );

          expect(
            result,
            isA<List<LicensePackage?>>(),
          );

          expect(
            result!.length,
            equals(
              <LicensePackage?>[
                LicensePackage(
                  packageName: (await data())!.first.packages.first,
                  packageOccorrences: (await data())!.first.packages.length,
                  paragraphs: <List<String?>?>[
                    await () async {
                      List<String?>? result = <String?>[];

                      for (final LicenseParagraph paragraph
                          in (await data())!.first.paragraphs) {
                        result.add(
                          paragraph.text,
                        );
                      }

                      return result;
                    }(),
                  ],
                ),
              ].length,
            ),
          );

          expect(
            result.first!.packageName,
            equals(
              <LicensePackage?>[
                LicensePackage(
                  packageName: (await data())!.first.packages.first,
                  packageOccorrences: (await data())!.first.packages.length,
                  paragraphs: <List<String?>?>[
                    await () async {
                      List<String?>? result = <String?>[];

                      for (final LicenseParagraph paragraph
                          in (await data())!.first.paragraphs) {
                        result.add(
                          paragraph.text,
                        );
                      }

                      return result;
                    }(),
                  ],
                ),
              ].first!.packageName,
            ),
          );

          expect(
            result.first!.packageOccorrences,
            equals(
              <LicensePackage?>[
                LicensePackage(
                  packageName: (await data())!.first.packages.first,
                  packageOccorrences: (await data())!.first.packages.length,
                  paragraphs: <List<String?>?>[
                    await () async {
                      List<String?>? result = <String?>[];

                      for (final LicenseParagraph paragraph
                          in (await data())!.first.paragraphs) {
                        result.add(
                          paragraph.text,
                        );
                      }

                      return result;
                    }(),
                  ],
                ),
              ].first!.packageOccorrences,
            ),
          );

          expect(
            result.first!.paragraphs,
            equals(
              <LicensePackage?>[
                LicensePackage(
                  packageName: (await data())!.first.packages.first,
                  packageOccorrences: (await data())!.first.packages.length,
                  paragraphs: <List<String?>?>[
                    await () async {
                      List<String?>? result = <String?>[];

                      for (final LicenseParagraph paragraph
                          in (await data())!.first.paragraphs) {
                        result.add(
                          "${'    ' * (paragraph.indent)}${paragraph.text}",
                        );
                      }

                      return result;
                    }(),
                  ],
                ),
              ].first!.paragraphs,
            ),
          );

          expect(
            result.first!.paragraphs!.length,
            equals(
              <LicensePackage?>[
                LicensePackage(
                  packageName: (await data())!.first.packages.first,
                  packageOccorrences: (await data())!.first.packages.length,
                  paragraphs: <List<String?>?>[
                    await () async {
                      List<String?>? result = <String?>[];

                      for (final LicenseParagraph paragraph
                          in (await data())!.first.paragraphs) {
                        result.add(
                          "${'    ' * (paragraph.indent)}${paragraph.text}",
                        );
                      }

                      return result;
                    }(),
                  ],
                ),
              ].first!.paragraphs!.length,
            ),
          );
        },
      );

      test(
        'Multiple `LicenseEntry`',
        () async {
          Future<List<LicenseEntry>?>? data = LicenseRegistry.licenses.toList();

          final List<LicensePackage?>? result = await convertLicensesFuture(
            data,
          );

          expect(
            result,
            isNotNull,
          );

          expect(
            result,
            isNotEmpty,
          );

          expect(
            result,
            isA<List<LicensePackage?>>(),
          );

          List<LicensePackage?> licenses = <LicensePackage?>[];

          for (LicenseEntry? licenseEntry in (await data)!) {
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
            for (LicenseParagraph? licenseParagraph
                in licenseEntry!.paragraphs) {
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

          for (LicensePackage? licensePackage in licenses) {
            expect(
              result!.any(
                (
                  LicensePackage? licensePackageResult,
                ) =>
                    licensePackageResult!.packageName ==
                    licensePackage!.packageName,
              ),
              isTrue,
            );

            expect(
              result
                  .firstWhere(
                    (
                      LicensePackage? licensePackageResult,
                    ) =>
                        licensePackageResult!.packageName ==
                        licensePackage!.packageName,
                  )!
                  .packageName,
              equals(
                licensePackage!.packageName,
              ),
            );

            expect(
              result.any(
                (
                  LicensePackage? licensePackageResult,
                ) =>
                    licensePackageResult!.packageOccorrences ==
                    licensePackage.packageOccorrences,
              ),
              isTrue,
            );

            expect(
              result
                  .firstWhere(
                    (
                      LicensePackage? licensePackageResult,
                    ) =>
                        licensePackageResult!.packageOccorrences ==
                        licensePackage.packageOccorrences,
                  )!
                  .packageOccorrences,
              equals(
                licensePackage.packageOccorrences,
              ),
            );

            expect(
              result.any(
                (
                  LicensePackage? licensePackageResult,
                ) =>
                    licensePackageResult!.paragraphs!.length ==
                    licensePackage.paragraphs!.length,
              ),
              isTrue,
            );

            expect(
              result
                  .firstWhere(
                    (
                      LicensePackage? licensePackageResult,
                    ) =>
                        licensePackageResult!.paragraphs!.length ==
                        licensePackage.paragraphs!.length,
                  )!
                  .paragraphs!
                  .length,
              equals(
                licensePackage.paragraphs!.length,
              ),
            );

            bool? compareAgainstResult = () {
              for (LicensePackage? resultToIterate in result) {
                if (resultToIterate!.packageName !=
                    licensePackage.packageName) {
                  continue;
                }

                if (resultToIterate.paragraphs!.length !=
                    licensePackage.paragraphs!.length) {
                  return false;
                }

                for (int firstIterationIndex = 0;
                    firstIterationIndex < resultToIterate.paragraphs!.length;
                    firstIterationIndex++) {
                  if (resultToIterate.paragraphs![firstIterationIndex] ==
                          null &&
                      licensePackage.paragraphs![firstIterationIndex] == null) {
                    return true;
                  }

                  if (resultToIterate.paragraphs![firstIterationIndex] ==
                          null ||
                      licensePackage.paragraphs![firstIterationIndex] == null ||
                      resultToIterate
                              .paragraphs![firstIterationIndex]!.length !=
                          licensePackage
                              .paragraphs![firstIterationIndex]!.length) {
                    return false;
                  }

                  for (int secondIterationIndex = 0;
                      secondIterationIndex <
                          resultToIterate
                              .paragraphs![firstIterationIndex]!.length;
                      secondIterationIndex++) {
                    if (resultToIterate.paragraphs![firstIterationIndex]![
                            secondIterationIndex] !=
                        licensePackage.paragraphs![firstIterationIndex]![
                            secondIterationIndex]) {
                      return false;
                    }
                  }
                }

                return true;
              }
            }();

            expect(
              compareAgainstResult,
              equals(
                true,
              ),
            );
          }
        },
      );
    },
  );
}
