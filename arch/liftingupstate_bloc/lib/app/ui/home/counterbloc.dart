// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:liftingupstate_bloc/app/domain/entities/appcounter.dart';
import 'package:liftingupstate_bloc/app/shared/app_iblocbase.dart';

class CounterBloc extends IBlocBase implements AppCounter {
  @override
  late int appCounter;

  final StreamController<int> _controller = StreamController<int>();
  Sink<int> get _inCounter => _controller.sink;
  Stream<int> get _outCounter => _controller.stream;

  final StreamController<int> _counterChangeController =
      StreamController<int>();
  Sink<int> get onChange => _counterChangeController.sink;

  CounterBloc() {
    appCounter = 0;
    _counterChangeController.stream.listen(_onCountChange);
  }

  

  @override
  void dispose() {
    _controller.close();
    _counterChangeController.close();
  }

  void _onCountChange(int myCount) {
    appCounter = myCount;
    _inCounter.add(myCount);
  }
}
