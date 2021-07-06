// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inherited_model/app/screens/inherited_views.dart';
import 'package:inherited_model/app/screens/numbermodel.dart';
import 'package:inherited_model/app/shared/app_vars.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          // ignore: avoid_redundant_argument_values
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text('Inherited Model Views'),
                InheritedModelView(type: NUMBER_TYPE.first, key: const Key('first'),),
                InheritedModelView(type: NUMBER_TYPE.second, key: const Key('second'),),
                InheritedModelView(type: NUMBER_TYPE.third, key: const Key('third'),),
                const SizedBox(height: 25.0),
                const Text('Inherited Widget Views'),
                InheritedWidgetView(type: NUMBER_TYPE.first, key: const Key('first'),),
                InheritedWidgetView(type: NUMBER_TYPE.second, key: const Key('second'),),
                InheritedWidgetView(type: NUMBER_TYPE.third, key: const Key('third'),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}