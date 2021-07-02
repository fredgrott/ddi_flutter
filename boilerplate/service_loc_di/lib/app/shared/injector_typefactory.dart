// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from simple_dependency_injector

import 'package:service_loc_di/app/shared/injector.dart';

class TypeFactory<T> {
  final bool _isSingleton;
  final ObjectFactoryWithParamsFn<T> _factoryFn;
  late T _instance;

  // ignore: avoid_positional_boolean_parameters
  TypeFactory(this._factoryFn, this._isSingleton);

  T get(Injector injector, Map<String, dynamic> additionalParameters) {
    if (_isSingleton && _instance != null) {
      return _instance;
    }

    final instance = _factoryFn(injector, additionalParameters);
    if (_isSingleton) {
      _instance = instance;
    }

    return instance;
  }
}
