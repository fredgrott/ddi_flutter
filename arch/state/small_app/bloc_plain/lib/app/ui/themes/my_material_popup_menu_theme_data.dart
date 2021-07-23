// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:bloc_plain/app/ui/themes/my_app_textstyles.dart';
import 'package:bloc_plain/app/ui/themes/my_color_schemes.dart';
import 'package:flutter/material.dart';



PopupMenuThemeData myMaterialPopupMenuThemeData = PopupMenuThemeData(
  elevation: 4,
  color: myColorSchemes.primary,
  enableFeedback: true,
  textStyle: myMaterialPopupMenuTextStyle,
  shape: const RoundedRectangleBorder(),
);

