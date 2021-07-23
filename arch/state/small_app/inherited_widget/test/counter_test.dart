// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:inherited_widget/app/domain/entities/icounter.dart';
import 'package:inherited_widget/app/my_app.dart';
import 'package:inherited_widget/app/shared/app_vars.dart';
import 'package:mocktail/mocktail.dart';

// this the only thing we need to mack as we want a hook to the behavior of the
// view-model which happens to be incrementing the underlying counter. Since
// Inherited Widget is only thin widget tree, one-screen apps we do not
// need to mock the counterprovider.
class MyCounter implements ICounter {
  @override
  int counter = 0;

  @override
  int increment() {
    return counter++;
  }
}

// our mock so that we can stub it and verify the increment behavior
class MockCounter extends Mock implements MyCounter {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final myCount = MockCounter();

  group('Counter test', () {
    testWidgets('Counter', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp(navigatorKey));

      // our stub
      when(() => myCount.increment()).thenReturn(1);

      myCount.increment();

      verify(() => myCount.increment()).called(1);

      expect(myCount.increment(), 1);

      expect(find.text('0'), findsOneWidget);
      // for crossplatform using the FPW plugin you grab icons via the keys argument that you manually add to app
      // to grain hooks for testing
      await tester.tap(find.byKey(const Key('increment')));
      await tester.pump();

      // Verify that our counter has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });
  });
}
