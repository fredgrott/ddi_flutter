// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intro_states_rebuilder/app/myapp.dart';
import 'package:intro_states_rebuilder/app/shared/app_vars.dart';

void main() {
  setUp(() async {
    // ignore: unused_local_variable

    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('counter test', () {
    testWidgets(
      'should increment by one',
      (WidgetTester widgetTester) async {
        await widgetTester.pumpWidget(MyApp(navigatorKey));

        expect(find.text('0'), findsOneWidget);

        //first tap
        await widgetTester.tap(find.byKey(const Key('increment')));
        await widgetTester.pump();

        //find two: one in the body of the scaffold and the other in the SnackBar
        expect(find.text('1'), findsOneWidget);
        
      },
    );
    

    //first tap
    
    
  });
}
