// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:setstate_bloc/app/domain/binders/bloc.dart';

abstract class StateBloc<T extends StatefulWidget>
    extends State<StatefulWidget> {
  //
  @override
  Widget build(BuildContext context);

  /// You need to be able access the widget.
  @override
  StatefulWidget get widget => super.widget;

  /// Register this bloc with this State object.
  bool addBloc(Bloc bloc) => bloc.pushState(this);

  /// Call the State object's setState() function.
  @override
  void setState(VoidCallback fn) => super.setState(fn);

  /// Allows the user to call setState().
  /// Refresh the interface by 'rebuilding' the Widget Tree
  // ignore: no-empty-block
  void refresh() => setState(() {});
}
