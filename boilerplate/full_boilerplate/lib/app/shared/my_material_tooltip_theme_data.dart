// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

TooltipThemeData myMaterialTooltipThemeData = const TooltipThemeData(
  height: 65,
  padding: EdgeInsetsGeometry.infinity,
  margin: EdgeInsetsGeometry.infinity,
  verticalOffset: 20,
  preferBelow: true,
  excludeFromSemantics: true,
  waitDuration: Duration(microseconds: 10,),
  showDuration: Duration(seconds: 5),
);