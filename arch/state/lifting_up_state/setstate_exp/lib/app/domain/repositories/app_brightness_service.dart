// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/widgets.dart';

/// Grab the Brightness setting via window so that 
/// we can get anywhere even before MaterialApp or 
/// CupertinoApp is initialized
/// @author Fredrick Allan Grott
class AppBrightnessService {
  AppBrightnessService();

  

  Future<Brightness> getAppBrightness() async{
    
    return MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
        .platformBrightness;
  }
}
