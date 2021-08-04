// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';


import 'package:fredgrottbloc/app/shared/app_vars.dart';
import 'package:fredgrottbloc/app/shared/build_modes.dart';
import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';



// Use Cases:  Logger Types:
//                 new logger
//
//             Setups of Appenders, Formatters, Streams, etc for
//             both debug and production.
//
//             I simplified this by eliminating using Logger.detached as
//             most will never use non-hierarchal logging.
//
//             Most Important Rules About Singletons:
//             1. A containerized registered singleton can be tested
//             2. We want only those things that do not take up much memory
//                as Singletons. And we never ever put View-Model or App-Models
//                as Singletons.
//
//             This means that we can use a singleton for our app logger.

// OOP Notes: Abstract(Interface) pairs up with Classes that have implements keyword
//            extends keyword refers to extending behavior of the parent class

// TYPES

///  LoggingTypes interface, ie the abstract contract of what the loggingtypes thing is.
/// @author Fredrick Allan Grott
abstract class LoggingTypes {
  Logger get appLogger;
}

/// Extends the LoggingTypes interface definition to now mean that appLogger
/// now means a function newLogger(name) returning a fully defined logger.
/// @author Fredrick Allan Grott
extension LoggingSpawner on LoggingTypes {
  Logger newLogger(String name) => Logger('${appLogger.fullName}.$name');
}

LogRecordFormatter defaultLogRecordFormatter() =>
    const DefaultLogRecordFormatter();

LogRecordFormatter defaultReleaseLogRecordFormatter() =>
    const DefaultLogRecordFormatter();

// Formatters

class MyDevLogRecordFormatter extends LogRecordFormatter {
  const MyDevLogRecordFormatter();
  @override
  StringBuffer formatToStringBuffer(LogRecord rec, StringBuffer sb) {
    sb.write('${rec.time} ${rec.level.name} ${rec.zone} '
        '${rec.loggerName} - ${rec.message}');

    if (rec.error != null) {
      sb.writeln();
      sb.write('### ${rec.error?.runtimeType}: ');
      sb.write(rec.error);
    }
    // ignore: avoid_as
    final stackTrace = rec.stackTrace ??
        // ignore: cast_nullable_to_non_nullable
        (rec.error is Error ? (rec.error as Error).stackTrace : null);
    if (stackTrace != null) {
      sb.writeln();
      sb.write(stackTrace);
    }

    return sb;
  }
}

class MyReleaseLogRecordFormatter extends LogRecordFormatter {
  const MyReleaseLogRecordFormatter();
  @override
  StringBuffer formatToStringBuffer(LogRecord rec, StringBuffer sb) {
    sb.write('${rec.time} ${rec.level.name}  '
        '${rec.loggerName} - ${rec.message}');

    if (rec.error != null) {
      sb.writeln();
      sb.write('### ${rec.error?.runtimeType}: ');
      sb.write(rec.error);
    }
    // ignore: avoid_as
    final stackTrace = rec.stackTrace ??
        // ignore: cast_nullable_to_non_nullable
        (rec.error is Error ? (rec.error as Error).stackTrace : null);
    if (stackTrace != null) {
      sb.writeln();
      sb.write(stackTrace);
    }

    return sb;
  }
}

// Appenders

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

// Core App Logger

/// To use: 
/// '''dart
/// final myLogger = CoreAppLogger()
/// ```
/// @author Fredrick Allan Grott
class CoreAppLogger implements LoggingTypes {
  static late CoreAppLogger _instance;
  static late Logger _logger;
  
  static final appName = myAppTitle;

  @override
  // TODO: implement appLogger
  Logger get appLogger => _instance as Logger;

  // ignore: unused_element
  CoreAppLogger._internal() {
    _logger = newLogger(appName);
    if (isInDebugMode) {
      recordStackTraceAtLevel = Level.ALL;
      Logger.root.onRecord.listen((record) {
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
    if (isInReleaseMode) {
      recordStackTraceAtLevel = Level.OFF;
      _logger.level = Level.OFF;
    }
  }

  // ignore: sort_unnamed_constructors_first
  factory CoreAppLogger() => _instance;

  

}
