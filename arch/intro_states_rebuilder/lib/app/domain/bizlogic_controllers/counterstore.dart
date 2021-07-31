// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:intro_states_rebuilder/app/domain/models/countermodel.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

// I modified as we need to always log our store change values
// no need for the extra logging infrastructure as we just log the event
// Remember, counterStore is a global and can be easily mocked
//
// to inject
// int appCounterStore = CounterModel().inj<CounterModel>;
final counterStore = RM.inject<CounterModel>(() => CounterModel(0),
    onInitialized: (CounterModel? state) => log('CounterModel Initialized'),
    onWaiting: () => log('CounterModel Is waiting'),
    onError: (dynamic error, stackTrace) =>
        log('CounterModel Has error: $error, stacktrace: $stackTrace'),
    onData: (CounterModel data) => log('CounterModel Has data: $data'),
    undoStackLength: 8,
    //Called after new state calculation and just before state mutation
    middleSnapState: (MiddleSnapState middleSnap) {
      //Log all state transition.
      log('counterStore present: $middleSnap.currentSnap');
      log('counterStore next: $middleSnap.nextSnap');

      //any error checking via middleSnapState goes here

      //Can return another state
    },);
