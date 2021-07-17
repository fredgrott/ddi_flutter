// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inherited_databinding/app/bindings/modelbindingscope.dart';
import 'package:inherited_databinding/app/bizlogic_controllers/viewcontroller.dart';
import 'package:inherited_databinding/app/domain/models/counter_model.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ModelBinding<CounterModel>(
        initialModel: const CounterModel(),
        key: const Key('myapp'),
        child: Scaffold(
          body: Center(
            child: ViewController(),
          ),
        ),
      ),
    );
  }
}
