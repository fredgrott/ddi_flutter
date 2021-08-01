// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:setstate_bloc/app/domain/binders/bloc.dart';
import 'package:setstate_bloc/app/domain/entities/appcounter.dart';

class CounterBloc extends Bloc implements AppCounter {
  CounterBloc(){
    appCounter = 0;
  }

  @override
  late int appCounter;
  
  void onPressed() => appCounter++;
}