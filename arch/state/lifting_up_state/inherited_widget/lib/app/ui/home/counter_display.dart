// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:inherited_widget/app/domain/binders/model.dart';
import 'package:inherited_widget/app/domain/models/counter_model.dart';
import 'package:inherited_widget/app/shared/app_vars.dart';

class CounterDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Model.of<CounterModel>(context);
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PlatformText(
            
            myHomepageMessage,
            
          ),
          PlatformText(
            '${model!.counter}',
            key: const Key('counter'),
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
