// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:inherited_model/app/screens/color_models.dart';
import 'package:inherited_model/app/screens/numbermodel.dart';

class InheritedModelView extends StatelessWidget {
  final ColorRegistry r = ColorRegistry();

  final NUMBER_TYPE type;

  InheritedModelView({required Key key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberModel? model = NumberModel.of(context, aspect: type);

    return MyColoredBox(
      color: r.nextColor(),
      // ignore: prefer_const_constructors
      key: Key('colorbox'),
      child: model!.getLabeledText(type),
    );
  }
}

class InheritedWidgetView extends StatelessWidget {
  final ColorRegistry r = ColorRegistry();

  final NUMBER_TYPE type;

  InheritedWidgetView({required Key key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberModel? view = NumberModel.of(context, aspect: type);

    return ColoredBox(
      color: r.nextColor(),
      child: view!.getLabeledText(type),
    );
  }
}
