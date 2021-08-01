// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:begin_reactive/app/ui/themes/my_app_common_theme_vars.dart';
import 'package:begin_reactive/app/ui/themes/my_color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';



MaterialSliderData myMaterialSliderData = MaterialSliderData(
  widgetKey: const Key('slider'),
  value: 10,
  divisions: 20,
  min: 10,
  max: 40,
  activeColor: myColorSchemes.primary,
  inactiveColor: Colors.grey,
  label: sliderLabel,
  mouseCursor: MouseCursor.defer,
  autofocus: true,

);