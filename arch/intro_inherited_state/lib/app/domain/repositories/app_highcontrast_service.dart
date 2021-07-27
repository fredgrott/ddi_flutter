// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';

class AppHighContrastService {
  AppHighContrastService();

  Future<bool> getHighContrast() async{
    return MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
        .highContrast;
  }
}
