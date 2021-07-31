// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

String myAppTitle = "FullBoilerplate";

String myHomepageMessage = "You have pushed the button this many times:";

late final Injector injector;



final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
