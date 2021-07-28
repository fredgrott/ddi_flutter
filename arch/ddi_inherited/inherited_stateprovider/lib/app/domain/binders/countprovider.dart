// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:inherited_stateprovider/app/domain/models/countermodel.dart';

class CountProvider extends InheritedWidget {
  @override
  // ignore: overridden_fields
  final Widget child;
  final CounterModel counter;
  const CountProvider(
      {required Key key, required this.child, required this.counter,})
      : super(key: key, child: child);

  static CountProvider of(BuildContext context) {
    // ignore: cast_nullable_to_non_nullable
    return context.dependOnInheritedWidgetOfExactType<CountProvider>()
        as CountProvider;
  }

  @override
  bool updateShouldNotify(CountProvider oldWidget) {
    log('updating state');

    return true;
  }
}
