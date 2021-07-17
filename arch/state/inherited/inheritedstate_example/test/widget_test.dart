// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inheritedstate_example/app/domain/models/counter.dart';
import 'package:inheritedstate_example/app/my_app.dart';




// we use a way to mock to verify behavior, including all the use case domain stuff

void main() {
  group('Counter', () {
    

    // ignore: no-empty-block
    setUp(() {
      
    });

    testWidgets('counter example', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      
      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that our counter has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });
  });
  
}
