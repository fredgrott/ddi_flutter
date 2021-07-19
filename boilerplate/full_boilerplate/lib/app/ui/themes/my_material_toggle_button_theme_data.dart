// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:full_boilerplate/app/ui/themes/my_color_schemes.dart';




ToggleButtonsThemeData myMaterialToggleButtonThemeData = ToggleButtonsThemeData(
  borderWidth: 12,
  // ignore: avoid_redundant_argument_values
  borderRadius: const BorderRadius.horizontal(left: Radius.zero, right: Radius.zero),
  disabledBorderColor: Colors.grey,
  color: myColorSchemes.primary,
  selectedColor: myColorSchemes.primaryVariant,
  fillColor: myColorSchemes.secondary,
  focusColor: myColorSchemes.secondaryVariant,
  highlightColor: myColorSchemes.secondaryVariant,
  hoverColor: myColorSchemes.secondary,
  splashColor: myColorSchemes.primaryVariant,
  borderColor: myColorSchemes.secondary,
  selectedBorderColor: myColorSchemes.secondaryVariant,
  
  

);