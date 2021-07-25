// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';

class Model<T> extends InheritedWidget {
  const Model({
    required Key key,
    required this.value,
    required this.child,
  }) : super(key: key, child: child);

  final Widget child;

  final T value;

  static T? of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Model<T>>()?.value;
  }

  @override
  bool updateShouldNotify(Model oldWidget) {
    return oldWidget != this;
  }

  @override
  // ignore: invalid_override_of_non_virtual_member
  bool operator ==(Object o) =>
      identical(this, o) || o is Model && o.child == child && o.value == value;

  

  @override
  int get hashCode => child.hashCode ^ value.hashCode;
}
