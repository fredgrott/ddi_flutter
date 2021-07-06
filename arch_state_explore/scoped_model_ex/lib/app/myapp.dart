// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_ex/app/models.dart';
import 'package:scoped_model_ex/app/screens/home/myhomepage.dart';
import 'package:scoped_model_ex/app/shared/app_vars.dart';


class MyApp extends StatelessWidget {
  final AbstractModel model;

  const MyApp({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // At the top level of our app, we'll, create a ScopedModel Widget. This
    // will provide the CounterModel to all children in the app that request it
    // using a ScopedModelDescendant.
    return ScopedModel<AbstractModel>(
      model: model,
      child: MaterialApp(
        title: appTitle,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: MyHomePage(appTitle),
      ),
    );
  }
}
