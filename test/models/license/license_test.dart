import 'package:flutter_test/flutter_test.dart';
import 'dart:math';

import 'package:trent_u_class_locator/models/license/license.dart';

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
    'LicensePackage',
    () {
      LicensePackage? licensePackage;

      String? packageName;

      setUp(
        () {
          packageName = generateRandomString();

          licensePackage = LicensePackage(
            packageName: packageName,
          );
        },
      );

      test(
        'packageName',
        () {
          expect(
            licensePackage!.packageName,
            isA<String?>(),
          );

          expect(
            licensePackage!.packageName,
            isNotNull,
          );

          expect(
            licensePackage!.packageName,
            isNotEmpty,
          );

          expect(
            licensePackage!.packageName,
            equals(
              packageName,
            ),
          );
        },
      );

      test(
        'packageOccorrences',
        () {
          expect(
            (licensePackage!.packageOccorrences! % 1) == 0,
            true,
          );

          expect(
            licensePackage!.packageOccorrences,
            isNotNaN,
          );

          expect(
            licensePackage!.packageOccorrences,
            isNonZero,
          );

          expect(
            licensePackage!.packageOccorrences,
            isNotNull,
          );

          expect(
            licensePackage!.packageOccorrences,
            equals(
              1,
            ),
          );
        },
      );

      test(
        'paragraphs',
        () async {
          expect(
            licensePackage!.paragraphs,
            isA<List<List<String?>?>?>(),
          );

          for (List<String?>? paragraphIterationOne
              in licensePackage!.paragraphs!) {
            expect(
              paragraphIterationOne,
              isA<List<String?>?>(),
            );

            for (String? paragraphIterationTwo in paragraphIterationOne!) {
              expect(
                paragraphIterationTwo,
                isA<String?>(),
              );
            }
          }

          expect(
            licensePackage!.paragraphs,
            isNotNull,
          );

          expect(
            licensePackage!.paragraphs,
            equals(
              <List<String?>?>[],
            ),
          );
        },
      );

      test(
        'addPackageOccorrence',
        () async {
          expect(
            (licensePackage!.packageOccorrences! % 1) == 0,
            true,
          );

          expect(
            licensePackage!.packageOccorrences,
            isNotNaN,
          );

          expect(
            licensePackage!.packageOccorrences,
            isNonZero,
          );

          expect(
            licensePackage!.packageOccorrences,
            isNotNull,
          );

          expect(
            licensePackage!.packageOccorrences,
            equals(
              1,
            ),
          );

          int? numberOfPackageOccorrencesToAdd = Random().nextInt(100,);

          for (int? i = 0; i! < numberOfPackageOccorrencesToAdd; i++) {
            await licensePackage!.addPackageOccorrence();
          }

          expect(
            (licensePackage!.packageOccorrences! % 1) == 0,
            true,
          );

          expect(
            licensePackage!.packageOccorrences,
            isNotNaN,
          );

          expect(
            licensePackage!.packageOccorrences,
            isNonZero,
          );

          expect(
            licensePackage!.packageOccorrences,
            isNotNull,
          );

          expect(
            licensePackage!.packageOccorrences,
            equals(
              numberOfPackageOccorrencesToAdd + 1,
            ),
          );
        },
      );

      test(
        'addParagraph',
        () async {
          expect(
            licensePackage!.paragraphs,
            isA<List<List<String?>?>?>(),
          );

          for (List<String?>? paragraphIterationOne
              in licensePackage!.paragraphs!) {
            expect(
              paragraphIterationOne,
              isA<List<String?>?>(),
            );

            for (String? paragraphIterationTwo in paragraphIterationOne!) {
              expect(
                paragraphIterationTwo,
                isA<String?>(),
              );
            }
          }

          expect(
            licensePackage!.paragraphs,
            isNotNull,
          );

          expect(
            licensePackage!.paragraphs,
            equals(
              <List<String?>?>[],
            ),
          );

          int? numberOfParagraphsToAdd = Random().nextInt(100,);

          for (int? i = 0; i! < numberOfParagraphsToAdd; i++) {
            String? paragraphContent = generateRandomString();

            List<String?>? paragraphToAdd = <String?>[
              paragraphContent,
            ];

            await licensePackage!.addParagraph(
              paragraphToAdd: paragraphToAdd,
            );

            expect(
              licensePackage!.paragraphs!.length,
              equals(
                i + 1,
              ),
            );

            expect(
              licensePackage!.paragraphs,
              isNotNull,
            );

            for (List<String?>? paragraphIterationOne
                in licensePackage!.paragraphs!) {
              expect(
                paragraphIterationOne,
                isA<List<String?>?>(),
              );

              for (String? paragraphIterationTwo in paragraphIterationOne!) {
                expect(
                  paragraphIterationTwo,
                  isA<String?>(),
                );
              }
            }

            expect(
              licensePackage!.paragraphs!.last,
              equals(
                paragraphToAdd,
              ),
            );
          }
        },
      );
    },
  );
}
