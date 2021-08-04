// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/widgets.dart';
import 'package:o_one_bloc_provider/app/domain/bizlogic_controllers/app_counter_bloc.dart';

class AppCounterBlocProvider extends InheritedWidget {
  AppCounterBlocProvider({
    Key? key,
    required Widget child,
    required this.bloc,
  }) : super(key: key, child: child);

  late final AppCounterBloc bloc;

  static AppCounterBloc of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AppCounterBlocProvider>()!
        .bloc;
  }

  @override
  bool updateShouldNotify(AppCounterBlocProvider oldWidget) =>
      bloc != oldWidget.bloc;

}
