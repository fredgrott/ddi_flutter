// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:logging/logging.dart';

abstract class LoggingTypes {
  Logger get appLogger;
}

extension LoggingSpawner on LoggingTypes {
  Logger newLogger(String name) => Logger('${appLogger.fullName}.$name');
  Logger detachedLogger(String name) => Logger.detached(name);
}

mixin UiLoggerMixin implements LoggingTypes {
  @override
  Logger get appLogger => Logger('UILogger - ${runtimeType.toString()}');
}

mixin NetworkLoggingMixin implements LoggingTypes {
  @override
  Logger get appLogger => Logger('NetworkLogger - ${runtimeType.toString()}');
}
