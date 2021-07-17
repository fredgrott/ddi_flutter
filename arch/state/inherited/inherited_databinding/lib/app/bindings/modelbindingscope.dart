// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';



class _ModelBindingScope<T> extends InheritedWidget {
  const _ModelBindingScope({required Key key, required this.modelBindingState, required Widget child})
      : super(key: key, child: child);

  final _ModelBindingState<T> modelBindingState;

  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) => true;
}

class ModelBinding<T> extends StatefulWidget {
  const ModelBinding({
    required Key key,
    required this.initialModel,
    required this.child,
  })  : assert(initialModel != null),
        super(key: key);

  final T initialModel;
  final Widget child;

  @override
  _ModelBindingState<T> createState() => _ModelBindingState<T>();

  //static Type _typeOf<T>() =>
      //(<T>() => T)<_ModelBindingScope<T>>(); // https://github.com/dart-lang/sdk/issues/33297

  static T of<T>(BuildContext context) {
    //final Type scopeType = _typeOf<_ModelBindingScope<T>>();
    final _ModelBindingScope<T> scope =
        // ignore: cast_nullable_to_non_nullable
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope<T>>() as _ModelBindingScope<T>;

    return scope.modelBindingState.currentModel;
  }

  static void update<T>(BuildContext context, T newModel) {
    //final Type scopeType = _typeOf<_ModelBindingScope<T>>();
    final _ModelBindingScope<T> scope =
        // ignore: cast_nullable_to_non_nullable
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope<T>>() as _ModelBindingScope<T>;
    scope.modelBindingState.updateModel(newModel);
  }
}

class _ModelBindingState<T> extends State<ModelBinding<T>> {
  late T currentModel;

  @override
  void initState() {
    super.initState();
    currentModel = widget.initialModel;
  }

  void updateModel(T newModel) {
    if (newModel != currentModel) {
      setState(() {
        currentModel = newModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _ModelBindingScope<T>(
      modelBindingState: this,
      key: const Key("modelbindingstate"),
      child: widget.child,
    );
  }
}
