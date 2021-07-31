// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:intro_states_rebuilder/app/domain/models/countermodel.dart';

// this is the service layer as it has bizlogic in it for the contract of the domain
// to other layers
extension CounterX on CounterModel {
  // ignore: unnecessary_this
  int increment() => this.counter++;
}
