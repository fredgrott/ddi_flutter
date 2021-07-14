// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testing_example/app/myapp.dart';
import 'package:testing_example/app/shared/app_vars.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("Appbar and title", (WidgetTester tester) async{
    await tester.pumpWidget(MyApp(navigatorKey: navigatorKey,));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(
        find.byWidgetPredicate((widget) =>
            widget is AppBar &&
            widget.title is Text &&
            // ignore: cast_nullable_to_non_nullable
            (widget.title as Text).data!.startsWith(myAppTitle)),
        findsOneWidget,);

  });
}
