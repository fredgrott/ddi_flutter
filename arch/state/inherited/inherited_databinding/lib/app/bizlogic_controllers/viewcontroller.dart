// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inherited_databinding/app/bindings/modelbindingscope.dart';
import 'package:inherited_databinding/app/domain/models/counter_model.dart';

class ViewController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final CounterModel model = ModelBinding.of<CounterModel>(context);
        ModelBinding.update<CounterModel>(context, CounterModel(value: model.value + 1));
      },
      child: Text('Hello World ${ModelBinding.of<CounterModel>(context).value}'),
    );
  }
}
