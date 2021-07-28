// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inherited_stateprovider/app/my_app.dart';
import 'package:inherited_stateprovider/app/shared/app_vars.dart';

void main() {
  // ignore: no-empty-block
  setUpAll(() async {});

  setUp(() async {
    // ignore: unused_local_variable

    TestWidgetsFlutterBinding.ensureInitialized();
  });

  // ignore: no-empty-block
  tearDownAll(() async {});

  // ignore: no-empty-block
  tearDown(() async {
    // Code that clears caches can go here
  });

  group('Counter Increments', () {
    testWidgets('increment test', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp(navigatorKey));
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
