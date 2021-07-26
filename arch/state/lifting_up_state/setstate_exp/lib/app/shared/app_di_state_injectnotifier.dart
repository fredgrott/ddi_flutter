// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original is Inherited State by FlutterDevTools BSD and modifications are under BSD license

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class InjectNotifier<T> extends ChangeNotifier implements ValueListenable<T> {
  InjectNotifier(this._value);
  @override
  T get value => _value;
  set value(T newValue) {
    _value = newValue;
    notifyListeners();
  }

  T _value;
}
