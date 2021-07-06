// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Note: Unlike some languages such as Java, Dart does not have
//       typed exceptions. Error thrown is in fact a type as
//       Exception class itself just does a message string.

import 'package:logging/logging.dart';

typedef VoidFunction = void Function();

/// Call it like this in the catch part of a future try-catch:
/// return Future.error(new MyException(),StackTrace.current);
///
/// and in non Futures:
/// throw AppException('message');
/// @author Fredrick Allan Grott
class AppException implements Exception {
  late String cause;
  AppException(this.cause);
}

// This is not in the flutter or dart docs, via stackoverflow see:
// https://stackoverflow.com/questions/13579982/how-to-create-a-custom-exception-and-handle-it-in-dart
//
// to use this it would be something like:
//  tryFunction(appInitLog, myAppLogger);
void tryFunction(VoidFunction untrustworthy, Logger logger) {
  try {
    untrustworthy();
  } on AppException catch (e) {
    logger.shout(e.runtimeType, "error, function call failed");
  } on Exception {
    logger.shout('error function call failed');
  }
}
