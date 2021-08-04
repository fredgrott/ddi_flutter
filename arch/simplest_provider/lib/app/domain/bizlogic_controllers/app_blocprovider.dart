// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';

abstract class IBlocBase {
  /// Anything extending the [BlocBase] must implement the dispose method
  /// Used to dispose the [StreamController]s that are used in [bloc]s
  void dispose();
}

class AppBlocProvider<T extends IBlocBase> extends InheritedWidget {
  const AppBlocProvider({
    required Key? key,
    required this.bloc,
    required this.child,
  }) : super(key: key, child: child);

  @override
  final Widget child;

  final T bloc;

  static Type _typeOf<T>() => T;

  static T of<T extends IBlocBase>(BuildContext context) {
    final type = _typeOf<AppBlocProvider<T>>();
    final AppBlocProvider<T>? provider =
        context.dependOnInheritedWidgetOfExactType();

    return provider!.bloc;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
