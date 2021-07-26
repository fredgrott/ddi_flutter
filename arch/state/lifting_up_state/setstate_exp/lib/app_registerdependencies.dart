// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:setstate_exp/app/domain/repositories/app_brightness_service.dart';
import 'package:setstate_exp/app/domain/repositories/app_config.dart';
import 'package:setstate_exp/app/domain/repositories/app_counter_service.dart';
import 'package:setstate_exp/app/domain/repositories/app_locale_services.dart';
import 'package:setstate_exp/app/domain/repositories/app_logger_service.dart';
import 'package:setstate_exp/app/domain/repositories/app_test_service.dart';
import 'package:setstate_exp/app/shared/app_di_state_inheritedstate.dart';
import 'package:setstate_exp/app/shared/app_di_state_servicelocator.dart';
import 'package:setstate_exp/app/shared/app_vars.dart';

void appRegisterDependencies() {
  // sets the simple ie singleton stuff that have a very low memory footprint and hence can
  // be referenced this way.
  SL.register(
    () =>
        AppConfig(appName: 'SetStateExp', myHomePageMessage: myHomepageMessage),
  );
  // register our dependencies that we will get later on usually in a stateful or
  // stateless widget via the inherited widget builder pattern
  SL.register(() => AppCounterService());
  SL.register(() => AppTestService(RS.getReactiveFromRoot()));
  SL.register(() => AppLoggerService());
  SL.register(() => AppBrightnessService());
  SL.register(() => AppLocaleServices());
}
