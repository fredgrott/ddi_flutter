// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// non-function alias for typedefs is not available yet to use with
// current dart version as otherwise we could substitute a typedef for
// this abstract class
import 'package:logging/logging.dart';

abstract class LoggingTypes {
  Logger get appLogger;
}

extension LoggingSpawner on LoggingTypes {
  Logger newLogger(String name) => Logger('${appLogger.fullName}.$name');
  Logger detachedLogger(String name) => Logger.detached(name);
}
