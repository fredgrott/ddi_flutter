// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:get_it/get_it.dart';

class AppModel {}

class AppModelImplementation extends AppModel {
  AppModelImplementation();
}

class ConfigService {
  ConfigService() {
    init();
  }

  Future init() async {
    GetIt.instance.signalReady(this);
  }
}
