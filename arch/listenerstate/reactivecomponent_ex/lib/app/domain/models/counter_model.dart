// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:reactivecomponent_ex/app/shared/app_reactive.dart';
import 'package:reactivecomponent_ex/app/shared/app_reactive_component.dart';
import 'package:reactivecomponent_ex/app/shared/app_reactive_sink.dart';

class CounterModel with ReactiveComponent {
  CounterModel(this._initialCount);

  late final int _initialCount;

  late VoidReactiveSink _increment;
  VoidReactiveSink get increment => _increment;

  late Reactive<int> __count;
  
  Reactive<int> get _count =>  __count ??= Reactive<int>(_initialCount, disposer: disposer);

  /// Publicize only the stream of [_count] to hide its data mutating
  /// and the other behaviors.
  /// It's a good point to transform the stream as necessary.
  Stream<int> get count => _count.stream;
}
