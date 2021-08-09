// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_unused_constructor_parameters



import 'package:kiwi/kiwi.dart';
import 'package:kiwi_counterapp/app/shared/app_logging.dart';
import 'package:kiwi_counterapp/app/shared/app_vars.dart';
import 'package:logging/logging.dart';

// We Put All The IoC stuff in one Location except
// the IoC initiation step

void initIOC() {
  iocContainer = KiwiContainer();
  iocContainer.registerInstance(KiwiLogger());
  iocContainer.registerSingleton(
    (container) => KiwiLogger(),
    name: 'AppLogger',
  );
  iocContainer.registerFactory((container) =>
      LoggingService(container.resolve<KiwiLogger>('AppLogger')));
}

// our IoC container

// In IoC methodology we have services of the IoC container
// that then receive instances of things we can then use app-wide
// in short words these are dependency services supplying
// dependencies.
class DependencyService {}

// We need to hook in our logging infrastructure so we use a
// class constructor to grab the appLogger created in our
// logging infrastructure. Warning, still need to put
// my initLogger function before the IoC init function.
class KiwiLogger {
  KiwiLogger();

  Logger myLogger = appLogger;
}

class LoggingService extends DependencyService {
  LoggingService(KiwiLogger ourLogger);
}
