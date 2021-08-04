// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:developer';

import 'package:bloc_provider/bloc_provider.dart';

class CounterBloc implements Bloc {

  @override
  late int appCounter;

  CounterBloc() {
    appCounter = 1;

    actionController.stream.listen(increaseStream);
  }


  final streamController = StreamController<int>();

  // event flow from counter to UI display, hence Stream
  Stream<int> get pressedCount => streamController.stream;
  // event flow from UI user action, hence the Sink
  Sink get addValue => streamController.sink;

  StreamController actionController = StreamController<dynamic>();
  StreamSink get incrementCounter => actionController.sink;






  void increaseStream(dynamic data) {
    appCounter += 1;
    log('counter increased by one');
    addValue.add(appCounter);
  }

  @override
  void dispose() {
    streamController.close();
    actionController.close();
  }

  
}