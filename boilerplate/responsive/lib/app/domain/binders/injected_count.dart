// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:responsive/app/domain/models/count_model.dart';
import 'package:responsive/app/shared/logging_strategies.dart';
import 'package:states_rebuilder/states_rebuilder.dart';


final myLogger = CoreAppLogger().appLogger;

final injectedCount = RM.inject<CountModel>(
  () => CountModel(0),
  undoStackLength: 8,
  //Called after new state calculation and just before state mutation
  // always freaking log state changes as assists in debugging
  middleSnapState: (MiddleSnapState middleSnap) {
    //Log all state transition.
    myLogger.info(middleSnap.currentSnap);
    myLogger.info(middleSnap.nextSnap);

    middleSnap.log(preMessage: "state logged"); //Build-in logger

    //Can return another state
  },
);
