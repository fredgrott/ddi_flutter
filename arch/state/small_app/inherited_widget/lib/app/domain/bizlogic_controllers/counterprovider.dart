// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:inherited_widget/app/domain/models/countermodel.dart';

// In Flutter we use the Provider word to mean a state controller and yes 
// it is a minimal state DI container as it's using Inherited Widget.
// 
// This is what we had as DI and state before the Flutter Team created 
// the provider plugin package.


class CounterProvider extends InheritedWidget {
  // ignore: overridden_fields
  final Widget child;
  final CounterModel myCounter;

  const CounterProvider({
    required Key key,
    required this.child,
    required this.myCounter,
  }) : super(key: key, child: child);

  static CounterProvider of(BuildContext context) {
    // ignore: cast_nullable_to_non_nullable
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>()
        as CounterProvider;
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}
