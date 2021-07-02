// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from simple_dependency_injector

class InjectorException implements Exception {
  String message;

  InjectorException(this.message);

  @override
  String toString() => 'Injector Exception: $message';
}
