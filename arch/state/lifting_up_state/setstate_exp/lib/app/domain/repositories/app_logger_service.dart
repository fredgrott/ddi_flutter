// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:logging/logging.dart';
import 'package:setstate_exp/app/shared/logging_strategies.dart';

class AppLoggerService {
  AppLoggerService();

  

  Future<Logger> getTheAppLogger(){
    return CoreAppLogger().appLogger as Future<Logger>;
  }
}
