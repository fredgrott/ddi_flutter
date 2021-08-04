// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:developer';

import 'package:fredgrottbloc/app/shared/app_blocprovider.dart';
import 'package:fredgrottbloc/app/shared/app_ibloc.dart';

class AppBloc extends IBloc {
  late int appCounter;
  final appCounterStreamController = StreamController<int>();

  AppBloc() {
    appCounter = 1;

    actionController.stream.listen(increaseStream);
  }


  Stream<int> get pressedCount => appCounterStreamController.stream;
  Sink get addValue => appCounterStreamController.sink;

  StreamController actionController = StreamController<dynamic>();
  StreamSink get incrementCounter => actionController.sink;

  void increaseStream(dynamic data) {
    appCounter += 1;
    log('counter increased by one');
    addValue.add(appCounter);
  }

  @override
  void dispose() {
    appCounterStreamController.close();
    actionController.close();
  }
}

