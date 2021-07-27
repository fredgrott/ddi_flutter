// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:intro_inherited_state/app/shared/logging_strategies.dart';
import 'package:logging/logging.dart';

class AppLoggerService {
  AppLoggerService();

  Logger getAppLogger() {
    return CoreAppLogger().appLogger;
  }
}
