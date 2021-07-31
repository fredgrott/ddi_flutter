// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:intro_states_rebuilder/app/shared/logging_strategies.dart';
import 'package:intro_states_rebuilder/brightnessservice.dart';
import 'package:logging/logging.dart';
// to initialize container in main:
//    injector = InjectModuleContainer().initialise(Injector());
// then to call it is:
//   injector.get<CoreAppLogger>().appLogger.info('start app initialization');
class InjectModuleContainer {
  Injector initialise(Injector injector) {
    injector.map<Logger>((injector) => CoreAppLogger() as Logger,
        isSingleton: true);

    //to call will be:
    // injector.get<BrightnessService>().getAppBrightness()
    injector.map<BrightnessService>((injector) => BrightnessService());

    return injector;
  }
}
