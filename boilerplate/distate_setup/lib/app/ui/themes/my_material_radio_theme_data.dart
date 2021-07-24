// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:distate_setup/app/ui/themes/my_app_common_theme_vars.dart';
import 'package:flutter/material.dart';





RadioThemeData myMaterialRadioThemeData = RadioThemeData(
 visualDensity: VisualDensity.adaptivePlatformDensity,
 materialTapTargetSize: MaterialTapTargetSize.padded,
 splashRadius: 14,
 mouseCursor: MaterialStateProperty.all(MouseCursor.defer),
 fillColor: MaterialStateProperty.all(myFilledColor),
 overlayColor: MaterialStateProperty.all(myOverlayColor),
 
);