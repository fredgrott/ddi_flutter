// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inherited_bloc/app/domain/models/counter.dart';
import 'package:inherited_bloc/app/my_app.dart';


import 'package:mocktail/mocktail.dart';

// we use a way to mock to verify behavior, including all the use case domain stuff
class MyCounter{
  late int count;
  dynamic increment() {
    count++;
  }
}


class MockCounter extends Mock implements MyCounter {}

void main() {
  group('Counter', () {
    late Counter counter;

    setUp(() {
      counter = MockCounter() as Counter;
    });

    testWidgets('counter example', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      when<dynamic>(() => counter.increment())
          .thenReturn(counter.count.toString());
      
      // verifies that mock result matches actual counter increment
      verify<dynamic>(() => counter.increment()).called(1);

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
