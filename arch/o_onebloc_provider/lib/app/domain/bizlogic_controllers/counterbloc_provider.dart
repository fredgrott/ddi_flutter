// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:o_one_bloc_provider/app/domain/bizlogic_controllers/counter_bloc.dart';

class CounterBlocProvider extends BlocProvider<CounterBloc> {
  CounterBlocProvider({
    required Widget child,
  }) : super(
          child: child,
          creator: (context, _bag) {
            return CounterBloc();
          },
        );

  static CounterBloc of(BuildContext context) => BlocProvider.of(context);
}
