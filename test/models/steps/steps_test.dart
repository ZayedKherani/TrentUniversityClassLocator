import 'package:flutter_test/flutter_test.dart';
import 'dart:math';

import 'package:trent_u_class_locator/models/step/step.dart';
import 'package:trent_u_class_locator/models/steps/steps.dart';

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
    'TrentRoomFindSteps',
    () {
      int? numberOfSteps;

      List<TrentRoomFindStep?>? trentRoomFindSteps = [];

      List<String?>? stepNumbers = [];
      List<String?>? stepDescriptions = [];

      List<String?>? stepSmallImageAssetPaths = [];
      List<String?>? stepHDImageAssetPaths = [];
      List<String?>? stepFHDImageAssetPaths = [];

      TrentRoomFindSteps? steps;

      setUp(
        () {
          numberOfSteps = Random().nextInt(
                10,
              ) +
              1;

          for (int? i = 0; i! < numberOfSteps!; i++) {
            stepNumbers.add(generateRandomString());
            stepDescriptions.add(generateRandomString());

            stepSmallImageAssetPaths.add(generateRandomString());
            stepHDImageAssetPaths.add(generateRandomString());
            stepFHDImageAssetPaths.add(generateRandomString());
          }

          for (int? i = 0; i! < numberOfSteps!; i++) {
            trentRoomFindSteps.add(
              TrentRoomFindStep(
                stepNumber: stepNumbers[i],
                stepDescription: stepDescriptions[i],
                stepSmallImageAssetPath: stepSmallImageAssetPaths[i],
                stepHDImageAssetPath: stepHDImageAssetPaths[i],
                stepFHDImageAssetPath: stepFHDImageAssetPaths[i],
              ),
            );
          }

          steps = TrentRoomFindSteps(
            steps: trentRoomFindSteps,
          );
        },
      );

      test(
        'length',
        () {
          expect(
            steps!.length,
            isA<int?>(),
          );

          expect(
            steps!.length,
            isNotNull,
          );

          expect(
            steps!.length,
            isNonZero,
          );

          expect(
            steps!.length,
            isNotNaN,
          );

          expect(
            steps!.length,
            equals(
              numberOfSteps,
            ),
          );
        },
      );

      test(
        'findNextStepByNumber',
        () {
          for (int? i = 0; i! < numberOfSteps!; i++) {
            if (i + 1 > numberOfSteps!) {
              expect(
                steps!
                    .findNextStepByNumber(
                      stepNumbers[i],
                    )
                    ?.stepNumber,
                isNull,
              );

              expect(
                steps!
                    .findNextStepByNumber(
                      stepNumbers[i],
                    )
                    ?.stepDescription,
                isNull,
              );

              expect(
                steps!
                    .findNextStepByNumber(
                      stepNumbers[i],
                    )
                    ?.stepSmallImageAssetPath,
                isNull,
              );

              expect(
                steps!
                    .findNextStepByNumber(
                      stepNumbers[i],
                    )
                    ?.stepHDImageAssetPath,
                isNull,
              );

              expect(
                steps!
                    .findNextStepByNumber(
                      stepNumbers[i],
                    )
                    ?.stepFHDImageAssetPath,
                isNull,
              );
            } else {
              if (steps!.findNextStepByNumber(
                    stepNumbers[i],
                  ) !=
                  null) {
                expect(
                  steps!
                      .findNextStepByNumber(
                        stepNumbers[i],
                      )!
                      .stepNumber,
                  isA<String?>(),
                );

                expect(
                  steps!
                      .findNextStepByNumber(
                        stepNumbers[i],
                      )!
                      .stepNumber,
                  isNotNull,
                );

                expect(
                  steps!
                      .findNextStepByNumber(
                        stepNumbers[i],
                      )!
                      .stepNumber,
                  isNotEmpty,
                );

                expect(
                  steps!
                      .findNextStepByNumber(
                        stepNumbers[i],
                      )!
                      .stepNumber,
                  equals(
                    stepNumbers.firstWhere(
                      (
                        String? stepNumber,
                      ) =>
                          stepNumber ==
                          steps!
                              .findNextStepByNumber(
                                stepNumbers[i!],
                              )!
                              .stepNumber,
                    ),
                  ),
                );

                expect(
                  steps!
                      .findNextStepByNumber(
                        stepNumbers[i],
                      )!
                      .stepDescription,
                  isA<String?>(),
                );

                expect(
                  steps!
                      .findNextStepByNumber(
                        stepNumbers[i],
                      )!
                      .stepDescription,
                  isNotNull,
                );

                expect(
                  steps!
                      .findNextStepByNumber(
                        stepNumbers[i],
                      )!
                      .stepDescription,
                  isNotEmpty,
                );

                expect(
                  steps!
                      .findNextStepByNumber(
                        stepNumbers[i],
                      )!
                      .stepDescription,
                  equals(
                    stepDescriptions.firstWhere(
                      (
                        String? stepDescription,
                      ) =>
                          stepDescription ==
                          steps!
                              .findNextStepByNumber(
                                stepNumbers[i!],
                              )!
                              .stepDescription,
                    ),
                  ),
                );

                expect(
                  steps!
                      .findNextStepByNumber(
                        stepNumbers[i],
                      )!
                      .stepSmallImageAssetPath,
                  isA<String?>(),
                );

                expect(
                  steps!
                      .findNextStepByNumber(
                        stepNumbers[i],
                      )!
                      .stepSmallImageAssetPath,
                  isNotNull,
                );

                expect(
                  steps!
                      .findNextStepByNumber(
                        stepNumbers[i],
                      )!
                      .stepSmallImageAssetPath,
                  isNotEmpty,
                );

                expect(
                  steps!
                      .findNextStepByNumber(
                        stepNumbers[i],
                      )!
                      .stepSmallImageAssetPath,
                  equals(
                    stepSmallImageAssetPaths.firstWhere(
                      (
                        String? stepSmallImageAssetPath,
                      ) =>
                          stepSmallImageAssetPath ==
                          steps!
                              .findNextStepByNumber(
                                stepNumbers[i!],
                              )!
                              .stepSmallImageAssetPath,
                    ),
                  ),
                );

                expect(
                  steps!
                      .findNextStepByNumber(
                        stepNumbers[i],
                      )!
                      .stepHDImageAssetPath,
                  isA<String?>(),
                );

                expect(
                  steps!
                      .findNextStepByNumber(
                        stepNumbers[i],
                      )!
                      .stepHDImageAssetPath,
                  isNotNull,
                );

                expect(
                  steps!
                      .findNextStepByNumber(
                        stepNumbers[i],
                      )!
                      .stepHDImageAssetPath,
                  isNotEmpty,
                );

                expect(
                  steps!
                      .findNextStepByNumber(
                        stepNumbers[i],
                      )!
                      .stepHDImageAssetPath,
                  equals(
                    stepHDImageAssetPaths.firstWhere(
                      (
                        String? stepHDImageAssetPath,
                      ) =>
                          stepHDImageAssetPath ==
                          steps!
                              .findNextStepByNumber(
                                stepNumbers[i!],
                              )!
                              .stepHDImageAssetPath,
                    ),
                  ),
                );

                expect(
                  steps!
                      .findNextStepByNumber(
                        stepNumbers[i],
                      )!
                      .stepFHDImageAssetPath,
                  isA<String?>(),
                );

                expect(
                  steps!
                      .findNextStepByNumber(
                        stepNumbers[i],
                      )!
                      .stepFHDImageAssetPath,
                  isNotNull,
                );

                expect(
                  steps!
                      .findNextStepByNumber(
                        stepNumbers[i],
                      )!
                      .stepFHDImageAssetPath,
                  isNotEmpty,
                );

                expect(
                  steps!
                      .findNextStepByNumber(
                        stepNumbers[i],
                      )!
                      .stepFHDImageAssetPath,
                  equals(
                    stepFHDImageAssetPaths.firstWhere(
                      (
                        String? stepFHDImageAssetPath,
                      ) =>
                          stepFHDImageAssetPath ==
                          steps!
                              .findNextStepByNumber(
                                stepNumbers[i!],
                              )!
                              .stepFHDImageAssetPath,
                    ),
                  ),
                );
              }
            }
          }
        },
      );

      test(
        'operator []',
        () {
          for (int? i = 0; i! < numberOfSteps!; i++) {
            expect(
              steps![i]!.stepNumber,
              isA<String?>(),
            );

            expect(
              steps![i]!.stepNumber,
              isNotNull,
            );

            expect(
              steps![i]!.stepNumber,
              isNotEmpty,
            );

            expect(
              stepNumbers.contains(
                steps![i]!.stepNumber,
              ),
              equals(
                true,
              ),
            );

            expect(
              steps![i]!.stepDescription,
              isA<String?>(),
            );

            expect(
              steps![i]!.stepDescription,
              isNotNull,
            );

            expect(
              steps![i]!.stepDescription,
              isNotEmpty,
            );

            expect(
              stepDescriptions.contains(
                steps![i]!.stepDescription,
              ),
              equals(
                true,
              ),
            );

            expect(
              steps![i]!.stepSmallImageAssetPath,
              isA<String?>(),
            );

            expect(
              steps![i]!.stepSmallImageAssetPath,
              isNotNull,
            );

            expect(
              steps![i]!.stepSmallImageAssetPath,
              isNotEmpty,
            );

            expect(
              stepSmallImageAssetPaths.contains(
                steps![i]!.stepSmallImageAssetPath,
              ),
              equals(
                true,
              ),
            );

            expect(
              steps![i]!.stepHDImageAssetPath,
              isA<String?>(),
            );

            expect(
              steps![i]!.stepHDImageAssetPath,
              isNotNull,
            );

            expect(
              steps![i]!.stepHDImageAssetPath,
              isNotEmpty,
            );

            expect(
              stepHDImageAssetPaths.contains(
                steps![i]!.stepHDImageAssetPath,
              ),
              equals(
                true,
              ),
            );

            expect(
              steps![i]!.stepFHDImageAssetPath,
              isA<String?>(),
            );

            expect(
              steps![i]!.stepFHDImageAssetPath,
              isNotNull,
            );

            expect(
              steps![i]!.stepFHDImageAssetPath,
              isNotEmpty,
            );

            expect(
              stepFHDImageAssetPaths.contains(
                steps![i]!.stepFHDImageAssetPath,
              ),
              equals(
                true,
              ),
            );
          }
        },
      );

      test(
        'findStepByNumber',
        () {
          for (int? i = 0; i! < numberOfSteps!; i++) {
            expect(
              steps!
                  .findStepByNumber(
                    stepNumbers[i],
                  )!
                  .stepNumber,
              isA<String?>(),
            );

            expect(
              steps!
                  .findStepByNumber(
                    stepNumbers[i],
                  )!
                  .stepNumber,
              isNotNull,
            );

            expect(
              steps!
                  .findStepByNumber(
                    stepNumbers[i],
                  )!
                  .stepNumber,
              isNotEmpty,
            );

            expect(
              steps!
                  .findStepByNumber(
                    stepNumbers[i],
                  )!
                  .stepNumber,
              equals(
                stepNumbers[i],
              ),
            );

            expect(
              steps!
                  .findStepByNumber(
                    stepNumbers[i],
                  )!
                  .stepDescription,
              isA<String?>(),
            );

            expect(
              steps!
                  .findStepByNumber(
                    stepNumbers[i],
                  )!
                  .stepDescription,
              isNotNull,
            );

            expect(
              steps!
                  .findStepByNumber(
                    stepNumbers[i],
                  )!
                  .stepDescription,
              isNotEmpty,
            );

            expect(
              steps!
                  .findStepByNumber(
                    stepNumbers[i],
                  )!
                  .stepDescription,
              equals(
                stepDescriptions[i],
              ),
            );

            expect(
              steps!
                  .findStepByNumber(
                    stepNumbers[i],
                  )!
                  .stepSmallImageAssetPath,
              isA<String?>(),
            );

            expect(
              steps!
                  .findStepByNumber(
                    stepNumbers[i],
                  )!
                  .stepSmallImageAssetPath,
              isNotNull,
            );

            expect(
              steps!
                  .findStepByNumber(
                    stepNumbers[i],
                  )!
                  .stepSmallImageAssetPath,
              isNotEmpty,
            );

            expect(
              steps!
                  .findStepByNumber(
                    stepNumbers[i],
                  )!
                  .stepSmallImageAssetPath,
              equals(
                stepSmallImageAssetPaths[i],
              ),
            );

            expect(
              steps!
                  .findStepByNumber(
                    stepNumbers[i],
                  )!
                  .stepHDImageAssetPath,
              isA<String?>(),
            );

            expect(
              steps!
                  .findStepByNumber(
                    stepNumbers[i],
                  )!
                  .stepHDImageAssetPath,
              isNotNull,
            );

            expect(
              steps!
                  .findStepByNumber(
                    stepNumbers[i],
                  )!
                  .stepHDImageAssetPath,
              isNotEmpty,
            );

            expect(
              steps!
                  .findStepByNumber(
                    stepNumbers[i],
                  )!
                  .stepHDImageAssetPath,
              equals(
                stepHDImageAssetPaths[i],
              ),
            );

            expect(
              steps!
                  .findStepByNumber(
                    stepNumbers[i],
                  )!
                  .stepFHDImageAssetPath,
              isA<String?>(),
            );

            expect(
              steps!
                  .findStepByNumber(
                    stepNumbers[i],
                  )!
                  .stepFHDImageAssetPath,
              isNotNull,
            );

            expect(
              steps!
                  .findStepByNumber(
                    stepNumbers[i],
                  )!
                  .stepFHDImageAssetPath,
              isNotEmpty,
            );

            expect(
              steps!
                  .findStepByNumber(
                    stepNumbers[i],
                  )!
                  .stepFHDImageAssetPath,
              equals(
                stepFHDImageAssetPaths[i],
              ),
            );
          }

          expect(
            steps!.findStepByNumber(
              generateRandomString(),
            ),
            isNull,
          );
        },
      );
    },
  );
}
