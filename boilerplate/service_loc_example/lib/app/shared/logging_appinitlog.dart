// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:logging/logging.dart';
import 'package:service_loc_example/app/shared/app_vars.dart';
import 'package:service_loc_example/app/shared/build_modes.dart';
import 'package:service_loc_example/app/shared/logging_appenders.dart';
import 'package:service_loc_example/app/shared/logging_formatters.dart';

Logger myAppLogger = Logger(appLoggerName);

void appInitLog() {
  if (isInDebugMode) {
    // do we want trace level
    recordStackTraceAtLevel = Level.ALL;
    myAppLogger.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      //I already have accounted for the zone info in my appender and record formatter pairs
      if (record.error != null && record.stackTrace != null) {
        log('${record.level.name}: ${record.loggerName}: ${record.time}: ${record.message}: ${record.error}: ${record.stackTrace}');

        log(
            // ignore: prefer-trailing-comma
            'level: ${record.level.name} loggerName: ${record.loggerName} time: ${record.time} message: ${record.message} error: ${record.error} exception: ${record.stackTrace}');
      } else if (record.error != null) {
        log('level: ${record.level.name} loggerName: ${record.loggerName} time: ${record.time} message: ${record.message} error: ${record.error}');
      } else {
        log('level: ${record.level.name} loggerName: ${record.loggerName} time: ${record.time} message: ${record.message}');
      }
    });
    MyDevLogAppender(formatter: const MyDevLogRecordFormatter())
        .attachToLogger(Logger.root);
  }
  // print to console stuff gets applied at ZoneSpec definition in the main function so
  // no need to repeat it here.
  if (isInReleaseMode) {
    recordStackTraceAtLevel = Level.OFF;
    myAppLogger.level = Level.OFF;
  }
}
