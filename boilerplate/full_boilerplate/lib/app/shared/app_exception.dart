// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

class AppException implements Exception {
  String errorMessage() {
    return 'an app exception';
  }
}

// borrowed from portal, example of error class 
// so that we can do specialized throws.
//
// Type is the class where we want to throw
class AppError<T extends Type> extends Error {

  AppError._(this._object);




  late final Object _object;

  @override
  String toString() {
    return '''
Error: Could not find a $T above this $_object.
''';
  }
}
