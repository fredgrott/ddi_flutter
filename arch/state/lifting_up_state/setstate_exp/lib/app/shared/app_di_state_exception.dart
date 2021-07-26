// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original is Inherited State by FlutterDevTools BSD and modifications are under BSD license

class DiStateException implements Exception {
  @override
  // ignore: no_runtimetype_tostring
  String toString() => '$runtimeType DI State Exception';
}

class DiStateError<T extends Type> extends Error {
  DiStateError._(this._object);

  // ignore: unused_field
  late final Object _object;

  @override
  // ignore: no_runtimetype_tostring
  String toString() => 'DI State: $runtimeType and $stackTrace errors';
}
