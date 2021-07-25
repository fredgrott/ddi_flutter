// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';

class CounterUpdate extends Notification {
  final int value;

  CounterUpdate(this.value);
}
