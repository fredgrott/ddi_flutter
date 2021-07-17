// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:inherited_state/inherited_state.dart';
import 'package:inheritedstate_example/app/domain/models/counter.dart';
import 'package:inheritedstate_example/app/shared/logging_strategies.dart';

final myLogger = CoreAppLogger().appLogger;

class TestService {
  TestService(this._counter) {
    _counter.stateListener.addListener(_onChange);
  }

  void _onChange() {
    myLogger.info(_counter.state.count.toString());
  }

  final ReactiveController<Counter> _counter;

  void dispose() {
    _counter.stateListener.removeListener(_onChange);
  }
}