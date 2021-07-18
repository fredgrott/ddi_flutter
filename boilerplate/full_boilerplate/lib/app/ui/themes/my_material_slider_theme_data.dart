// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:full_boilerplate/app/ui/themes/my_color_scheme.dart';

SliderThemeData myMaterialSliderThemeData = SliderThemeData(
  trackHeight: 8,
  activeTrackColor: MyColorScheme.primary,
  inactiveTrackColor: MyColorScheme.primaryVariant,
  disabledActiveTrackColor: MyColorScheme.secondary,
  disabledInactiveTrackColor: MyColorScheme.secondaryVariant,
  activeTickMarkColor: MyColorScheme.secondary,
  inactiveTickMarkColor: MyColorScheme.secondaryVariant,
  disabledActiveTickMarkColor: MyColorScheme.primary,
  disabledInactiveTickMarkColor: MyColorScheme.primaryVariant,
  thumbColor: MyColorScheme.secondary,
  disabledThumbColor: MyColorScheme.secondaryVariant,
  overlappingShapeStrokeColor: MyColorScheme.secondaryVariant,
  overlayColor: MyColorScheme.primaryVariant,
  valueIndicatorColor: MyColorScheme.secondary,
  showValueIndicator: ShowValueIndicator.always,
);