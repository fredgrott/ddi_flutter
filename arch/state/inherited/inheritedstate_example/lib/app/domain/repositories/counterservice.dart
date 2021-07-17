// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:inheritedstate_example/app/domain/repositories/apiservice.dart';

class CounterService {
  CounterService(this._apiService);

  // ignore: unused_field
  final ApiService _apiService;
  final _initValue = 0;

  Future<int> getInitialCounter() async {
    
    return _initValue;
  }
}
