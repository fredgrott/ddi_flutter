// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inherited_state/inherited_state.dart';
import 'package:inheritedstate_example/app/domain/models/counter.dart';
import 'package:inheritedstate_example/app/domain/repositories/appconfig.dart';
import 'package:inheritedstate_example/app/ui/home/my_homepage.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InheritedState(
        states: [
          Inject<Counter>(() => Counter()),
        ],
        builder: (_) {
          // final appConfig = InheritedService.get<AppConfig>();
          final appConfig = SL.get<AppConfig>()!;

          return MaterialApp(
            title: appConfig.appName,
            home: MyHomePage(title: appConfig.appName),
          );
        },);
  }
}
