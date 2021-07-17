// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:full_boilerplate/app/shared/my_color_scheme.dart';


FloatingActionButtonThemeData myMaterialFloatingActionBarThemeData = FloatingActionButtonThemeData(
  enableFeedback: true,
  elevation: 10,
  splashColor: MyColorScheme.primaryVariant,
  focusColor: MyColorScheme.secondary,
  hoverColor: MyColorScheme.secondaryVariant,
  foregroundColor: MyColorScheme.surface,
  backgroundColor: MyColorScheme.background,
);