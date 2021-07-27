// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:given_when_then/given_when_then.dart';
import 'package:intro_inherited_state/app/my_app.dart';
import 'package:intro_inherited_state/generated/l10n.dart';
import 'package:mocktail/mocktail.dart';

class MockContext extends Mock implements BuildContext {}

/// This is a test support harness. Its what we use to set up
/// test suites using eBay's given_when_then test library.
/// See
/// https://pub.dev/packages/given_when_then
///
/// @author Fredrick Allan Grott
Future<void> Function(WidgetTester) harness(
    // ignore: prefer-trailing-comma
    WidgetTestHarnessCallback<_WidgetTestHarness> callback) {
  return (tester) =>
      givenWhenThenWidgetTest(_WidgetTestHarness(tester), callback);
}

class _WidgetTestHarness extends WidgetTestHarness {
  _WidgetTestHarness(WidgetTester tester) : super(tester);
}

extension AppBarGiven on WidgetTestGiven<_WidgetTestHarness> {
  Future<void> myAppExists() async {
    await tester.pumpWidget(MyApp());
  }
}

extension AppBarWhen on WidgetTestWhen<_WidgetTestHarness> {
  Future<void> appBarFound() async {
    await tester.pump();
    expect(find.byType(AppBar), findsOneWidget);
  }
}

extension ExampleThen on WidgetTestThen<_WidgetTestHarness> {
  static late final BuildContext _mockContext = MockContext();

  


  Future<void> appBarTitleIs() async {
    await tester.pump();
    expect(find.text(AppLocalizations.of(_mockContext).appTitle), findsOneWidget);
  }
}
