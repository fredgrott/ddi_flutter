// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:state_notifier/state_notifier.dart';

abstract class CountLogger {
  void countChanged(int count);
}

class MyState {
  MyState(this.count);
  final int count;
}

class CounterModelNotifier extends StateNotifier<MyState>
    with LocatorMixin, DiagnosticableTreeMixin {
  CounterModelNotifier() : super(MyState(0));

  void increment() {
    state = MyState(state.count + 1);
  }

  @override
  @protected
  set state(MyState value) {
    if (state.count != value.count) {
      read<CountLogger>().countChanged(value.count);
    }
    super.state = value;
  }

  // so that it shows in the devtool
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', state.count));
  }
}

class DebugLogger implements CountLogger {
  @override
  void countChanged(int count) {
    // ignore: avoid_print
    log('Count changed $count');
  }
}
