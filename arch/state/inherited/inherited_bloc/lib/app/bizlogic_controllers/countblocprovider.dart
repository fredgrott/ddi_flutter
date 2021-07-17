// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:inherited_bloc/app/bizlogic_controllers/counterbloc.dart';

class CountBlocProvider extends InheritedWidget {
  final CounterBloc bloc;
  // ignore: annotate_overrides
  final Widget child;
  const CountBlocProvider({required this.bloc, required this.child}) : super(child: child);

  static CountBlocProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CountBlocProvider>();
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
