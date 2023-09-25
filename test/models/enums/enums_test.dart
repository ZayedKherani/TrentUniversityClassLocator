import 'package:flutter_test/flutter_test.dart';

import 'package:trent_u_class_find/models/enums/enums.dart';

void main() {
  group(
    'TrentCenters',
    () {
      for (var center in TrentCenters.values) {
        test(
          center.name,
          () => expect(
            TrentCenters.values[TrentCenters.values.indexOf(center)],
            equals(center),
          ),
        );
      }
    },
  );
}
