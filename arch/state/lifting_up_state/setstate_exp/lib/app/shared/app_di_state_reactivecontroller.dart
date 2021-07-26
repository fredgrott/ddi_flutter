// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:setstate_exp/app/shared/app_di_state_inheritedstate.dart';
import 'package:setstate_exp/app/shared/app_di_state_inject.dart';

class ReactiveController<T> {
  ReactiveController(this._inject) : super();

  final Injectable<T> _inject;

  T get state => _inject.singleton;
  ValueListenable<T?> get stateListener => _inject.notifier;

  void setState(dynamic Function(T)? stateUpdateFn) {
    final dynamic updateResult = stateUpdateFn?.call(state);
    final newState = updateResult is T ? updateResult : state;
    if (newState != null) {
      InheritedState.replaceReactive(_inject, newState);
    }
  }
}
