// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:bloc_widget/app/domain/entities/counterbloc_event.dart';
import 'package:bloc_widget/app/domain/entities/counterbloc_state.dart';
import 'package:bloc_widget/app/domain/blocs/increasecounter_event.dart';
import 'package:bloc_widget/app/domain/blocs/latestcounter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  CounterBloc(CounterBlocState initialState) : super(initialState);

  //Set Initial State of Counter Bloc by return the LatestCounterState Object with newCounterValue = 0
  CounterBlocState get initialState => LatestCounterState(newCounterValue: 0);

  @override
  Stream<CounterBlocState> mapEventToState(CounterBlocEvent event) async* {
    // TODO: implement mapEventToState
    if (event is IncreaseCounterEvent) {
      //Fetching Current Counter Value From Current State
      final int currentCounterValue = (state as LatestCounterState).newCounterValue;

      //Applying business Logic
      final int newCounterValue = currentCounterValue + 1;

      //Adding new state to the Stream, yield is used to add state to the stream
      yield LatestCounterState(newCounterValue: newCounterValue);
    }
  }
}
