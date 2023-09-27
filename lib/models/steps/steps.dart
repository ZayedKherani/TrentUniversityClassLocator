import 'package:trent_u_class_locator/models/step/step.dart';

class TrentRoomFindSteps {
  final List<TrentRoomFindStep?>? steps;

  int? get length => steps!.length;

  const TrentRoomFindSteps({
    required this.steps,
  });

  TrentRoomFindStep? operator [](int index) => steps![index];

  TrentRoomFindStep? findStepByNumber(
    String? stepNumber,
  ) {
    if (stepNumber == null) {
      return null;
    }

    return steps!.firstWhere(
      (TrentRoomFindStep? step) => step!.stepNumber == stepNumber,
      orElse: () => null,
    );
  }

  TrentRoomFindStep? findNextStepByNumber(
    String? stepNumber,
  ) {
    if (stepNumber == null) {
      return null;
    }

    final int index = steps!.indexWhere(
      (TrentRoomFindStep? step) => step!.stepNumber == stepNumber,
    );

    if (index == -1) {
      return null;
    }

    if (index + 1 >= steps!.length) {
      return null;
    }

    return steps![index + 1];
  }
}
