// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:setstate_bloc/app/domain/binders/statebloc.dart';

mixin StateSets {
  late StateBloc stateBloc;
  final Set<StateBloc> stateMVCSet = {};

  bool pushState(StateBloc state) {
   
    stateBloc = state;

    return stateMVCSet.add(state);
  }

  bool removeState(StateBloc state) {
    
    if (state == stateBloc) {
      return popState();
    }

    return stateMVCSet.remove(state);
  }

  bool popState() {
    
    // Remove the 'current' state
    final removed = stateMVCSet.remove(stateBloc);
    // Reassign the last state object.
    // ignore: prefer-conditional-expressions
    if (stateMVCSet.isEmpty) {
      stateBloc = Container() as StateBloc<StatefulWidget>;
    } else {
      stateBloc = stateMVCSet.last;
    }

    return removed;
  }

  /// Return a 'copy' of the Set of State objects.
  Set<StateBloc> get states => Set.from(stateMVCSet.whereType<StateBloc>());
}
