// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// We need to grab something to mock

import 'package:distate_setup/app/domain/models/count_model.dart';
import 'package:distate_setup/app/my_app.dart';
import 'package:distate_setup/app/shared/app_vars.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// By mocking this we get the increment method
// as there is an extension on CountModel that
// way we can mock and stub and verify the
// behavior of the ServiceLayer before the VM
class MyCountCount extends CountModel {
  MyCountCount(int count) : super(count);

  // ignore: unnecessary_this
  int increment() => this.count;
}

class MockCount extends Mock implements MyCountCount {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final myCount = MockCount();

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
