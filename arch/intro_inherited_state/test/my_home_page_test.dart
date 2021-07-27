// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intro_inherited_state/app/my_app.dart';
import 'package:intro_inherited_state/generated/l10n.dart';
import 'package:mocktail/mocktail.dart';

import 'add_button_widget_test_support.dart';
import 'my_page_objects.dart';

// An example of how to do acceptance testing using only flutter and dart
// with no use of gherkin-cucumber stuff

// Patterns to Mocktail:
// 1. Mock the Class
// 2. Declare a reference at root of main Test function
// 3. initialize the var with the Mock
// 4. Individual tests use the initialized mock ref
class MockContext extends Mock implements BuildContext {}

// ignore: long-method
void main() {
  late BuildContext _mockContext;
  setUp(() async {
    // ignore: unused_local_variable
    _mockContext = MockContext();

    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('Has MyApp and App Title ', () {
    testWidgets('My home widget has a title and message, using PageObject',
        // ignore: prefer-trailing-comma
        (WidgetTester tester) async {
      
      await tester.pumpWidget(MyApp());
      final app = MyAppPageObject();
      expect(app.home.title,
          allOf(findsOneWidget, _HasText(AppLocalizations.of(_mockContext).appTitle)),);
    });

    group('Has user Message ', () {
      testWidgets('My home widget  message, using PageObject',
          // ignore: prefer-trailing-comma
          (WidgetTester tester) async {
        await tester.pumpWidget(MyApp());
        final app = MyAppPageObject();
        expect(
            // ignore: prefer-trailing-comma
            app.home.message,
            // ignore: prefer-trailing-comma
            allOf(findsOneWidget, _HasText(AppLocalizations.of(_mockContext).appHomepageMessage),));
      });

      group('User pressed add and counter changes ', () {
        testWidgets(
            'Ensure that when user taps add, it increments text number to one',
            harness((given, when, then) async {
          await given.haveMyHomePage();
          await when.userPerformsTapAdd();
          await then.makeSureCounterReadsOne();
        }),);
      });
    });
  });
}

// our custom matcher
// ignore: unused_element
class _HasText extends CustomMatcher {
  _HasText(dynamic matcher) : super('Text data', 'data', matcher);

  @override
  String? featureValueOf(dynamic actual) {
    if (actual is Finder) {
      final element = actual.evaluate().single;
      final widget = element.widget;
      if (widget is Text) {
        return widget.data;
      } else {
        // ignore: avoid_escaping_inner_quotes
        throw Exception('_HasText matcher can\'t be applied to $element');
      }
    } else {
      throw Exception(
          // ignore: prefer-trailing-comma
          '_HasText matcher can only be applied to a Finder object');
    }
  }
}
