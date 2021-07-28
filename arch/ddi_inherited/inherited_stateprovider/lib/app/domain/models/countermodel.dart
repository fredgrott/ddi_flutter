// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:inherited_stateprovider/app/domain/entities/countentity.dart';

class CounterModel implements ICountEntity {
  @override
  late int count;

  CounterModel(this.count);
  int increment() {
    log('increase count model by one');

    return count++;
  }
}
