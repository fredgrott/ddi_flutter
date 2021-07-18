// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:full_boilerplate/app/ui/themes/my_color_scheme.dart';

PopupMenuThemeData myMaterialPopupMenuThemeData = PopupMenuThemeData(
  elevation: 4,
  color: MyColorScheme.primary,
  enableFeedback: true,
  textStyle: myMaterialPopupMenuTextStyle,
);

TextStyle myMaterialPopupMenuTextStyle = TextStyle();