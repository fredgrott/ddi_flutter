// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inherited_widget/app/my_app.dart';
import 'package:inherited_widget/app/shared/app_vars.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('counter test', () {
    testWidgets('Counter', (WidgetTester tester) async {
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
