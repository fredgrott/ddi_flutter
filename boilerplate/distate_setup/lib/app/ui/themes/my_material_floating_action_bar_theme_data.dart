// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:distate_setup/app/ui/themes/my_color_schemes.dart';
import 'package:flutter/material.dart';






FloatingActionButtonThemeData myMaterialFloatingActionBarThemeData = FloatingActionButtonThemeData(
  enableFeedback: true,
  elevation: 10,
  splashColor: myColorSchemes.primaryVariant,
  focusColor: myColorSchemes.secondary,
  hoverColor: myColorSchemes.secondaryVariant,
  foregroundColor: myColorSchemes.surface,
  backgroundColor: myColorSchemes.background,
  disabledElevation: 8,
  focusElevation: 14,
  hoverElevation: 16,
  highlightElevation: 18,
);