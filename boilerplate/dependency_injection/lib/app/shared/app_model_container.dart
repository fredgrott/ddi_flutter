// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:dependency_injection/app/shared/app_vars.dart';
import 'package:dependency_injection/app/shared/logging_appinitlog.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:logging/logging.dart';

// Note: Most DI implementations for Flutter and Dart require an abstraction layer
//       between the ModuleContainer and the naked dependencies to provide such things
//       as an ID of the dependency to log for example. Also provided is some minimal
//       logic when chaining dependencies.

class ApplicationLogger {
  final String diID = "TheAppLogger is initialized as a DI";

  String getLoggerName() => appLoggerName;

  Logger getLogger() => myAppLogger;
}

class AppProperties {
  final String diID = "AppProperties is initialized as a DI";

  String getAppTitle = appTitle;
}

class ModuleContainer {
  Injector initialize(Injector injector) {
    // only those things that take little memory can be singletons, for example view-models
    // cannot be di'd as singletons and instead are injected as factory instances
    injector.map<ApplicationLogger>(
      (i) => ApplicationLogger(),
      isSingleton: true,
    );
    injector.map<AppProperties>(
      (i) => AppProperties(),
      isSingleton: true,
    );

    return injector;
  }
}
