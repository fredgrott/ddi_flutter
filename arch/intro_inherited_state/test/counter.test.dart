// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intro_inherited_state/app/my_app.dart';

// Because of where the increment biz logic is we have nothing to mock out of
// the CountModel. For example, a more complex service locator for the app api layer or
// the domain layer could always be mocked to stub and verify behavior.

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('Counter Test', () {
    testWidgets(
        'My Counter increments by one', (WidgetTester widgetTester) async {
          await widgetTester.pumpWidget(MyApp());
          expect(find.text('0'), findsOneWidget);
          // for crossplatform using the FPW plugin you grab icons via the keys argument that you manually add to app
          // to grain hooks for testing
          await widgetTester.tap(find.byKey(const Key('increment')));
          await widgetTester.pump();

          // Verify that our counter has incremented.
          expect(find.text('0'), findsNothing);
          expect(find.text('1'), findsOneWidget);

        },);
  });
}
