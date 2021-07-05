// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';
import 'package:service_loc_di/app/shared/appender_types.dart';

class MyDevLogAppender extends BaseLogAppender {
  MyDevLogAppender({LogRecordFormatter? formatter})
      : super(formatter ?? defaultLogRecordFormatter());

  MyDevLogAppender setupLogging({
    Level level = Level.ALL,
    Level stderrLevel = Level.OFF,
  }) {
    Logger.root.clearListeners();
    Logger.root.level = level;

    return defaultLogAppender(stderrLevel: stderrLevel)
      ..attachToLogger(Logger.root);
  }

  void Function(Object line)? printer;

  @override
  void handle(LogRecord record) {
    log(formatter.format(record));
  }
}

MyDevLogAppender defaultLogAppender({
  LogRecordFormatter? formatter,
  Level? stderrLevel,
}) =>
    MyDevLogAppender(formatter: formatter);

class MyReleaseLogAppender extends BaseLogAppender {
  MyReleaseLogAppender({LogRecordFormatter? formatter})
      : super(formatter ?? defaultReleaseLogRecordFormatter());

  MyReleaseLogAppender setupLogging({
    Level level = Level.ALL,
    Level stderrLevel = Level.OFF,
  }) {
    Logger.root.clearListeners();
    Logger.root.level = level;
    // ignore: newline-before-return
    return defaultReleaseLogAppender(stderrLevel: stderrLevel)
      ..attachToLogger(Logger.root);
  }

  void Function(Object line)? printer;

  @override
  void handle(LogRecord record) {
    log(formatter.format(record));
  }
}

MyReleaseLogAppender defaultReleaseLogAppender({
  LogRecordFormatter? formatter,
  Level? stderrLevel,
}) =>
    MyReleaseLogAppender(formatter: formatter);
