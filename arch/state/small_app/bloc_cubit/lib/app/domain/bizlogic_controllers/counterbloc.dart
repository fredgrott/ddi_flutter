// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:bloc_cubit/app/domain/entities/counterevent.dart';
import 'package:bloc_cubit/app/domain/entities/counterstate.dart';
import 'package:bloc_cubit/app/domain/models/counterdecrement.dart';
import 'package:bloc_cubit/app/domain/models/counterincrement.dart';
import 'package:bloc_cubit/app/domain/models/counterrunningstate.dart';
import 'package:bloc_cubit/app/shared/logging_strategies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final myLogger = CoreAppLogger().appLogger;

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(CounterState initialState) : super(initialState);

  @override
  // ignore: override_on_non_overriding_member
  CounterState get initialState => const CounterRunningState(count: 0);

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    final int _current = (state as CounterRunningState).count;
    if (event is CounterIncrement) {
      myLogger.info('incrementing count by one');
      yield CounterRunningState(count: _current + event.count);
    } else if (event is CounterDecrement) {
      myLogger.info('decrement count by one');
      yield CounterRunningState(count: _current - event.count);
    }
  }
}
