// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:full_boilerplate/app/ui/themes/my_color_scheme.dart';

SnackBarThemeData myMaterialSnackbarThemeData = SnackBarThemeData(
  backgroundColor: MyColorScheme.background,
  elevation: 4,
  behavior: SnackBarBehavior.fixed,
  actionTextColor: MyColorScheme.primaryVariant,
  disabledActionTextColor: MyColorScheme.secondaryVariant,
);