// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:developer';

import 'package:bloc_plain/app/domain/entities/counteraction.dart';
import 'package:bloc_plain/app/domain/entities/dispose.dart';

class CounterBloc implements Dispose {
  late int _counter;
  final _stateStreamController = StreamController<int>();

  StreamSink<int> get _counterSink => _stateStreamController.sink;
  Stream<int> get counterStream => _stateStreamController.stream;

  final _stateEventController = StreamController<CounterAction>();

  StreamSink<CounterAction> get eventSink => _stateEventController.sink;
  Stream<CounterAction> get _eventStream => _stateEventController.stream;

  CounterBloc() {
    log("counter bloc constructor invoked");
    _counter = 0;
    _eventStream.listen((event) {
      log("eventStream.listen() method invoked");
      switch (event) {
        case CounterAction.increment:
          _counter++;
          // business logic
          break;
        
      }
      _counterSink.add(_counter);
    });
  }

  @override
  void dispose() {
    _stateStreamController.close();
    _stateEventController.close();
  }
}
