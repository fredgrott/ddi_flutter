// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:inherited_state/inherited_state.dart';



class AppTestService {
  AppTestService(this._counter) {
    _counter.stateListener.addListener(_onChange);
  }

  void _onChange() {
    log(_counter.state.value.toString());
  }

  final ReactiveController<Counter> _counter;

  void dispose() {
    _counter.stateListener.removeListener(_onChange);
  }
}
