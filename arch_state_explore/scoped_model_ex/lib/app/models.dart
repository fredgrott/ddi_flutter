// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:scoped_model/scoped_model.dart';

abstract class AbstractModel extends Model {
  int get counter;
  void increment();
}

class CounterModel extends AbstractModel {
  int _counter = 0;

  @override
  int get counter => _counter;

  @override
  // ignore: avoid_void_async
  void increment() async {
    // First, increment the counter
    _counter++;

    // needed for simulate an async action like an http request ...
    await Future<dynamic>.delayed(const Duration(seconds: 1));

    // Then notify all the listeners.
    notifyListeners();
  }
}

class TestModel extends AbstractModel {
  int _counter = 111;

  @override
  int get counter => _counter;

  @override
  void increment() {
    _counter += 2;
    notifyListeners();
  }
}