// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';

// I put my system read services at root of lib to remind me that they are not 
// clean classes or functions.

// how we map things that require state to be read from system
class BrightnessService {
  

  Future<Brightness> getAppBrightness() {

    return  MediaQueryData.fromWindow(WidgetsBinding.instance!.window).platformBrightness as Future<Brightness>; 

  }
}
