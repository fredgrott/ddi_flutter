// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import 'package:flutter_test/flutter_test.dart';



import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:setstate_exp/app/my_app.dart';
import 'package:setstate_exp/app/shared/app_vars.dart';
import 'package:setstate_exp/app/ui/home/my_homepage.dart';


// so we know what to match
String myTitle = myAppTitle;
String myMessage = myHomepageMessage;

/// I use eBays golden_toolkit
/// https://pub.dev/packages/golden_toolkit
///
/// This gets configured in the flutter-test_config file and only for widget tests.
/// As screens and complexities increase one will  mock or fake an app scenario
/// so one can test how screen should appear to than act as matcher to
/// test results.
///
///
/// @author Fredrick Allan Grott
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('Basic Golden Tests ', () {
    testWidgets('Golden test', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp(navigatorKey));
      await expectLater(find.byType(MyApp), matchesGoldenFile('main.png'));
    });
    testGoldens('DeviceBuilder ', (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: [
          Device.phone,
          Device.iphone11,
          Device.tabletPortrait,
          Device.tabletLandscape,
          samsungEightAndroid,
          samsungNineAndroid,
          iphonetwelvepromaxIOS,
        ])
        ..addScenario(
          widget: MyHomePage(
            title: myTitle,
            message: myMessage,
          ),
          name: 'default page',
        );
      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, "demo page multiple screens");
    });
  });
}

// eBay supplies a default material one but this gets extended
// and modified so that we have an ios-cupertino one generally
// based on this
// https://github.com/eBay/flutter_glove_box/blob/master/packages/golden_toolkit/lib/src/testing_tools.dart
WidgetWrapper myMaterialAppWrapper = materialAppWrapper();

//add cupertino-app wrapper when I do platexp widgets impl

// My Custom Device Defs, see
// https://github.com/eBay/flutter_glove_box/blob/master/packages/golden_toolkit/lib/src/device.dart


Device samsungNineAndroid = const Device(
  name: "S9-Android",
  size: Size(1440, 3040),
);

Device samsungEightAndroid = const Device(
  name: "S8-Android",
  size: Size(1440, 2960),
);

Device pixelxlAndroid = const Device(
  name: "PixelXL-Android",
  size: Size(1440, 2560),
);

Device pixelfouraAndroid = const Device(
  name: "Pixel4A-Android",
  size: Size(1080, 2340),
);

Device pixelfourxlAndroid = const Device(
  name: "Pixel4XL-Android",
  size: Size(1440, 3040),
);

Device pixelfourAndroid = const Device(
  name: "Pixel4-Android",
  size: Size(1080, 2280),
);

Device pixelthreeaxlAndroid = const Device(
  size: Size(1080, 2160),
  name: "Pixel3a-Android",
);

Device pixelthreeaAndroid = const Device(
  size: Size(1080, 2220),
  name: "Pixel3a-Android",
);

Device pixelthreeAndroid = const Device(
  name: "Pixel3-Android",
  size: Size(1440, 2960),
);

Device iphonetenxIOS = const Device(
  size: Size(1125, 2436),
  name: "iPhoneX-iOS",
);

Device iphonetwelvepromaxIOS = const Device(
  size: Size(1284, 2778),
  name: "iPhone12ProMax-IOS",
);
