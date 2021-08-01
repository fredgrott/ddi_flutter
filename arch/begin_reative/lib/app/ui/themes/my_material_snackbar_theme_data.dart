// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:begin_reactive/app/ui/themes/my_app_textstyles.dart';
import 'package:begin_reactive/app/ui/themes/my_color_schemes.dart';
import 'package:flutter/material.dart';


SnackBarThemeData myMaterialSnackbarThemeData = SnackBarThemeData(
  backgroundColor: myColorSchemes.background,
  elevation: 4,
  behavior: SnackBarBehavior.fixed,
  actionTextColor: myColorSchemes.primaryVariant,
  disabledActionTextColor: myColorSchemes.secondaryVariant,
  contentTextStyle: mySnackbarTextStyle,
);