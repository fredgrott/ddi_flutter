// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:setstate_exp/app/ui/themes/my_app_textstyles.dart';
import 'package:setstate_exp/app/ui/themes/my_color_schemes.dart';



PopupMenuThemeData myMaterialPopupMenuThemeData = PopupMenuThemeData(
  elevation: 4,
  color: myColorSchemes.primary,
  enableFeedback: true,
  textStyle: myMaterialPopupMenuTextStyle,
  shape: const RoundedRectangleBorder(),
);

