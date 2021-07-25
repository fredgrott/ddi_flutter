// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:bloc_cubit/app/domain/entities/counterstate.dart';

class CounterRunningState extends CounterState {
  final int count;
  const CounterRunningState({required this.count});

  @override
  List<Object> get props => [count];
}
