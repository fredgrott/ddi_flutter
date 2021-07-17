// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:inherited_state/inherited_state.dart';
import 'package:inheritedstate_example/app/domain/repositories/apiservice.dart';
import 'package:inheritedstate_example/app/domain/repositories/appconfig.dart';
import 'package:inheritedstate_example/app/domain/repositories/counterservice.dart';
import 'package:inheritedstate_example/app/domain/repositories/testservice.dart';
import 'package:inheritedstate_example/app/shared/app_vars.dart';

void registerDependencies() {
  SL.register(
    () => AppConfig(
      appName: appTitle,
      count: 0,
    ),
  );
  SL.register(() => ApiService(SL.get()!));
  SL.register(() => TestService(RS.getReactiveFromRoot()));
  SL.register(() => CounterService(SL.get()!));
}
