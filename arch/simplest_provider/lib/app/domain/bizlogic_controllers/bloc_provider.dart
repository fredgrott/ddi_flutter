// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';

abstract class BlocBase {
  /// Anything extending the [BlocBase] must implement the dispose method
  /// Used to dispose the [StreamController]s that are used in [bloc]s
  void dispose();
}

/// [BlocProvider] wraps the [child] with a [bloc], making the bloc available
/// to [child] and all children of the [BlocProvider]
///
/// [T] extends [BlocBase] meaning that any bloc that is passed into the [BlocProvider]
/// must extend [BlocBase] to be considered a viable bloc
class BlocProvider<T extends BlocBase> extends StatefulWidget {
  /// Creates a widget that allows [child] and children of [child] to access [bloc]
  ///
  /// The [bloc] and [child] arguments are required
  const BlocProvider({
    required Key key,
    required this.bloc,
    required this.child,
  }) : super(key: key);

  /// [bloc] will be made accessible to the child of the [BlocProvider].
  /// To be considered a viable [bloc], it must extend [BlocBase].
  final T bloc;

  /// [child] will have access to the bloc of the [BlocProvider].
  /// It remains untouched and will be returned in the build method.
  final Widget child;

  /// Method that searches up the widget tree for a [BlocProvider].
  /// It then returns the [bloc] of the [BlocProvider] that was found.
  ///
  /// Takes care of passing reference throughout the tree
  static T of<T extends BlocBase>(BuildContext context) {
    final type = _typeOf<BlocProvider<T>>();
    final BlocProvider<T>? provider = context.dependOnInheritedWidgetOfExactType();

    return provider!.bloc;
  }

  /// Method that returns the [Type] of the [Widget].
  ///
  /// Allows the [BlocProvider] to be used for all types of [bloc]s.
  ///
  /// Since we can have different kinds of [bloc]s that will extend [BlocBase],
  /// the of method, which is located above, needs to know which [BlocProvider] we are looking for.
  static Type _typeOf<T>() => T;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();
}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>> {
  /// This dispose method will call the dispose method in the [bloc]
  /// The dispose method in the [bloc] was required to be a viable [bloc] which we specified through [BlocBase]
  ///
  /// (Confusing explanation even in my head. Sorry about this.)
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
