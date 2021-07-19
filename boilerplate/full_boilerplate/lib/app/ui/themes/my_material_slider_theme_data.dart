// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:full_boilerplate/app/ui/themes/my_color_schemes.dart';


SliderThemeData myMaterialSliderThemeData = SliderThemeData(
  trackHeight: 8,
  activeTrackColor: myColorSchemes.primary,
  inactiveTrackColor: myColorSchemes.primaryVariant,
  disabledActiveTrackColor: myColorSchemes.secondary,
  disabledInactiveTrackColor: myColorSchemes.secondaryVariant,
  activeTickMarkColor: myColorSchemes.secondary,
  inactiveTickMarkColor: myColorSchemes.secondaryVariant,
  disabledActiveTickMarkColor: myColorSchemes.primary,
  disabledInactiveTickMarkColor: myColorSchemes.primaryVariant,
  thumbColor: myColorSchemes.secondary,
  disabledThumbColor: myColorSchemes.secondaryVariant,
  overlappingShapeStrokeColor: myColorSchemes.secondaryVariant,
  overlayColor: myColorSchemes.primaryVariant,
  valueIndicatorColor: myColorSchemes.secondary,
  showValueIndicator: ShowValueIndicator.always,
);