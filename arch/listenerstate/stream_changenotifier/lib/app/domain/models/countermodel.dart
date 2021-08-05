// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:flutter/widgets.dart';

class CounterModel extends ChangeNotifier {
  int _count = 0;

  void increment() {
    _count++;
    // yes we need to log state changes
    log('counter increased by one to: $_count');
    notifyListeners();
  }

  int get count => _count;
}
