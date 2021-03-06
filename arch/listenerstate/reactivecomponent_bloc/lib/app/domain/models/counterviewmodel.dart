// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:reactivecomponent_bloc/app/domain/entities/countermodel.dart';
import 'package:reactivecomponent_bloc/app/shared/app_reactive.dart';
import 'package:reactivecomponent_bloc/app/shared/app_reactive_component.dart';
import 'package:reactivecomponent_bloc/app/shared/app_reactive_sink.dart';

// Anything implying state changes in a model is in fact a view-model,
// whereas a CounterModel abstract class would just have the
// int _initialCount
//
// Repositories and Services are somewhat the same in that 
// we off-load work from the ViewModel when the complexities of 
// the models increase and the complexities of the apis access 
// increase.
class CounterViewModel with ReactiveComponent implements CounterModel {
  CounterViewModel(this._initialCount);
  final int _initialCount;

  late final VoidReactiveSink increment = VoidReactiveSink(
    () {
      _count.data++;
      // always log state changes
      log('count incremented to count value: $_count');
    },
    disposer: disposer,
  );

  late final _count = Reactive<int>(_initialCount, disposer: disposer);

  Stream<int> get count => _count.stream;
}
