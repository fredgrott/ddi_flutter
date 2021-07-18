// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:full_boilerplate/app/ui/themes/my_color_scheme.dart';

ButtonThemeData myMaterialButtonThemeData = ButtonThemeData(
  colorScheme: MyColorScheme,
  padding: EdgeInsetsGeometry.infinity,
  alignedDropdown: true,
  // ignore: avoid_redundant_argument_values
  layoutBehavior: ButtonBarLayoutBehavior.padded,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  disabledColor: Colors.grey,
  minWidth: 40,
  height: 20,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  splashColor: Colors.amber,
  focusColor: Colors.orangeAccent,
  hoverColor: Colors.yellowAccent,
  highlightColor: Colors.yellow,
  textTheme: ButtonTextTheme.primary,
);

 