// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:inherited_bloc/app/domain/models/mycounter.dart';

class CounterBloc {
  final additionController = StreamController<MyCounter>();

  Sink<MyCounter> get add => additionController.sink;

  final itemController = StreamController<int>();

  Stream<int> get itemCount => itemController.stream;

  CounterBloc() {
    additionController.stream.listen(onAdd);
  }

  void onAdd(MyCounter myCounter) {
    myCounter.increaseCount();
    itemController.add(myCounter.counter);
  }
}
