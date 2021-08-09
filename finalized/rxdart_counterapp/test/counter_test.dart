// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_basics_boilerplate/app/domain/blocs/counterviewmodel.dart';

import 'package:flutter_basics_boilerplate/app/my_app.dart';
import 'package:flutter_basics_boilerplate/app/shared/app_vars.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CounterViewModel counterViewModel;
  // ignore: no-empty-block
  setUpAll(() async {});

  setUp(() async {
    // ignore: unused_local_variable

    TestWidgetsFlutterBinding.ensureInitialized();
    counterViewModel = CounterViewModel();
  });

  // ignore: no-empty-block
  tearDownAll(() async {});

  // ignore: no-empty-block
  tearDown(() async {
    // Code that clears caches can go here
    counterViewModel.dispose;
  });

  group('Counter Test', () {
    testWidgets(
      'test the counter increments by one when add is pressed',
      (WidgetTester widgetTester) async {
        await widgetTester.pumpWidget(MyApp(navigatorKey));

        // Verify that our counter starts at 0.
        expect(find.text('0'), findsOneWidget);
        expect(find.text('1'), findsNothing);

        // Tap the '+' icon and trigger a frame.
        await widgetTester.tap(find.byKey(const Key('increment')));
        await widgetTester.pump();

        // Verify that our counter has incremented.
        expect(find.text('0'), findsNothing);
        expect(find.text('1'), findsOneWidget);
      },
    );
    // mock the ViewModel and see if it implements
  });
}
