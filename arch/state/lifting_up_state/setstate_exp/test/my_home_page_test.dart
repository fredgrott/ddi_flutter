// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:setstate_exp/app/my_app.dart';
import 'package:setstate_exp/app/shared/app_vars.dart';



import 'add_button_widget_test_support.dart';


import 'my_page_objects.dart';

// An example of how to do acceptance testing using only flutter and dart
// with no use of gherkin-cucumber stuff

// ignore: long-method
void main() {
  setUp(() async {
    // ignore: unused_local_variable

    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('Has MyApp and App Title ', () {
    testWidgets('My home widget has a title and message, using PageObject',
        // ignore: prefer-trailing-comma
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp(navigatorKey));
      final app = MyAppPageObject();
      expect(app.home.title, allOf(findsOneWidget, _HasText(myAppTitle)));
    });

    group('Has user Message ', () {
      testWidgets('My home widget  message, using PageObject',
          // ignore: prefer-trailing-comma
          (WidgetTester tester) async {
        await tester.pumpWidget(MyApp(navigatorKey));
        final app = MyAppPageObject();
        expect(
            // ignore: prefer-trailing-comma
            app.home.message,
            // ignore: prefer-trailing-comma
            allOf(findsOneWidget, _HasText(myHomepageMessage)));
      });

      group('User pressed add and counter changes ', () {
        testWidgets('Ensure that when user taps add, it increments text number to one', harness((given, when, then) async {
          await given.haveMyHomePage();
          await when.userPerformsTapAdd();
          await then.makeSureCounterReadsOne();
         }));

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
