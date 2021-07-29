// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:inherited_model_example/app/domain/binders/imodel.dart';

class ScopedModel<T extends IModel> extends StatelessWidget {

  /// The [Model] to provide to [child] and its descendants.
  final T model;

  /// The [Widget] the [model] will be available to.
  final Widget child;

  const ScopedModel({required this.model, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: model,
      builder: (context, _) => _InheritedModel<T>(model: model, child: child),
    );
  }
  
  static T of<T extends IModel>(
    BuildContext context, {
    bool rebuildOnChange = false,
  }) {
    final InheritedWidget? widget = rebuildOnChange
        ? context.dependOnInheritedWidgetOfExactType<_InheritedModel<T>>()
        : context
            .getElementForInheritedWidgetOfExactType<_InheritedModel<T>>()
            ?.widget;

    if (widget == null) {
      throw Error();
    } else {
      return (widget as _InheritedModel<T>).model;
    }
  }
}

class _InheritedModel<T extends IModel> extends InheritedWidget {
  final T model;
  final int version;

  _InheritedModel({Key? key, required Widget child, required T model})
      // ignore: prefer_initializing_formals, unnecessary_this
      : this.model = model,
        // ignore: unnecessary_this
        this.version = model.myVersion,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedModel<T> oldWidget) =>
      oldWidget.version != version;
}

typedef ScopedModelDescendantBuilder<T extends IModel> = Widget Function(
  BuildContext context,
  Widget? child,
  T model,
);

class ScopedModelDescendant<T extends IModel> extends StatelessWidget {
  /// Builds a Widget when the Widget is first created and whenever
  /// the [Model] changes if [rebuildOnChange] is set to `true`.
  final ScopedModelDescendantBuilder<T> builder;

  /// An optional constant child that does not depend on the model.  This will
  /// be passed as the child of [builder].
  final Widget? child;

  /// An optional value that determines whether the Widget will rebuild when
  /// the model changes.
  final bool rebuildOnChange;

  /// Creates the ScopedModelDescendant
  const ScopedModelDescendant({
    required this.builder,
    this.child,
    this.rebuildOnChange = true,
  });

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      child,
      ScopedModel.of<T>(context, rebuildOnChange: rebuildOnChange),
    );
  }
}
