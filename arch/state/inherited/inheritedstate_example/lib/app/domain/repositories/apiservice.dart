// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:inheritedstate_example/app/domain/repositories/appconfig.dart';

class ApiService {
  const ApiService(this._appConfig);

  final AppConfig _appConfig;

  String get appName => _appConfig.appName;

  int get countValue => _appConfig.count;

  
}
