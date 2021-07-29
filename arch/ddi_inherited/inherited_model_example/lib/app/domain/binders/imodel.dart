// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from Scoped Model



import 'dart:async';

import 'package:flutter/widgets.dart';

abstract class IModel extends Listenable {
  //converted to set literal from
  // final Set<VoidCallback> _listeners = Set<VoidCallback>();
  final Set<VoidCallback> _listeners = <VoidCallback>{};
  int myVersion = 0;
  int _microtaskVersion = 0;

  // invoked when model changes, very important for widget based DI solutions
  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  // returns number of listeners
  int get listenerCount => _listeners.length;

  @protected
  void notifyListeners() {
    // We schedule a microtask to debounce multiple changes that can occur
    // all at once.
    if (_microtaskVersion == myVersion) {
      _microtaskVersion++;
      scheduleMicrotask(() {
        myVersion++;
        _microtaskVersion = myVersion;

        // Convert the Set to a List before executing each listener. This
        // prevents errors that can arise if a listener removes itself during
        // invocation!
        _listeners.toList().forEach((VoidCallback listener) => listener());
      });
    }
  }




}