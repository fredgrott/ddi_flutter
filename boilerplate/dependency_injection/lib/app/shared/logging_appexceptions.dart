// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

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
void tryFunction(VoidFunction untrustworthy) {
  try {
    untrustworthy();
  } on AppException catch (e, s) {
    log("error: $e, stacktrace: $s");
  } on Exception {
    log("error");
  }
}
