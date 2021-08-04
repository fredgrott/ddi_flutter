// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:flutter_test/flutter_test.dart';




import 'package:page_object/page_object.dart';
import 'package:simplest_provider/app/my_app.dart';
import 'package:simplest_provider/app/ui/home/my_homepage.dart';




// Page Objects so that we can craft matchers to
// grab screen(page) objects. If we have more than one screen, then
// more screen page objects will be here.

/// Uses eBay PageObjects to decrease finder complexities when 
/// doing finding in complex screens. See
/// https://pub.dev/packages/page_object
/// 
/// Example of use is in the my_home_page_test
/// 
/// You will always have a page_object file to 
/// pair up with a screen-page test file.
/// 
/// @author Fredrick Allan Grott
class MyAppPageObject extends PageObject {
  MyAppPageObject() : super(find.byType(MyApp));

  MyHomePageObject get home => MyHomePageObject(this);
}

class MyHomePageObject extends PageObject {
  MyHomePageObject(Finder finder)
      : super(find.descendant(of: finder, matching: find.byType(MyHomePage)));

  Finder get title =>
      find.descendant(of: this, matching: find.byKey(MyHomePage.titleKey));

  Finder get message =>
      find.descendant(of: this, matching: find.byKey(MyHomePage.messageKey));
}