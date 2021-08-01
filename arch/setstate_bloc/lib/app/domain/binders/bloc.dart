// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:setstate_bloc/app/domain/binders/blocstatesetter.dart';
import 'package:setstate_bloc/app/domain/binders/statebloc.dart';

class Bloc extends BlocStateSetter {
  //
  Bloc([StateBloc? state]) : super() {
    // Associate it with the specified State object.
    addState(state!);
    // Include it in a collection of Blocs.
    if (!_blocs.containsValue(this)) {
      // ignore: unnecessary_this
      _blocs.addAll({this.runtimeType: this});
    }
  }

  /// Associate this Controller to the specified State object
  /// to use that State object's functions and features.
  dynamic addState(StateBloc state) {
    
    return pushState(state);
  }

  /// The current StateBloc object.
  StateBloc get appStateBloc => stateBloc;

  /// The current State object.
  State get state => stateBloc;

  /// Retrieve an existing Bloc by type.
  /// Note There can't be more than one of the same type.
  /// It retrieves the last one entered.
  static Bloc? of<T extends Bloc>() => _blocs[_type<T>()];

  static final Map<Type, Bloc> _blocs = {};

  static Type _type<T>() => T;
}
