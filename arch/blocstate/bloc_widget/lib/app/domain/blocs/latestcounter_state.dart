// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:bloc_widget/app/domain/entities/counterbloc_state.dart';

class LatestCounterState extends CounterBlocState {
  final int newCounterValue;

  LatestCounterState({required this.newCounterValue});

  //override this method as base class extends equatable and pass property inside props list
  @override
  // TODO: implement props
  List<Object> get props => [newCounterValue];
}
