// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:inherited_bloc/app/domain/models/counter.dart';


class CountProvider extends InheritedWidget {
  // ignore: annotate_overrides
  final Widget child;
  final Counter counter;
  const CountProvider({required Key key, required this.child, required this.counter})
      : super(key: key, child: child);

  static CountProvider of(BuildContext context) {
    // ignore: cast_nullable_to_non_nullable
    return context.dependOnInheritedWidgetOfExactType<CountProvider>()
        as CountProvider;
  }

  @override
  bool updateShouldNotify(CountProvider oldWidget) {
    return true;
  }
}


