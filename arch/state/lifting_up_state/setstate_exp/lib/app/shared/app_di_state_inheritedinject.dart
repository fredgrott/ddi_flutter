// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original is Inherited State by FlutterDevTools BSD and modifications are under BSD license

import 'package:flutter/widgets.dart';
import 'package:setstate_exp/app/shared/app_di_state_inject.dart';

class InheritedInject<T> extends InheritedWidget {
  const InheritedInject(
      {Key? key, required Widget child, required this.injectable,})
      : super(key: key, child: child);

  final Injectable<T> injectable;

  @override
  bool updateShouldNotify(InheritedInject<T> oldWidget) => true;
}
