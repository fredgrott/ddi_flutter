// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:full_boilerplate/app/ui/themes/my_color_schemes.dart';


MaterialFlatButtonData myMaterialFlatButtonData = MaterialFlatButtonData(
  widgetKey: const Key('flatbutton'),
  color: myColorSchemes.primary,
  padding: EdgeInsetsGeometry.infinity,
  disabledColor: Colors.grey,
  disabledElevation: 4,
  disabledTextColor: Colors.black12,
  elevation: 10,
  highlightColor: myColorSchemes.primaryVariant,
  highlightElevation: 14,
  splashColor: myColorSchemes.secondary,
  textColor: myColorSchemes.secondaryVariant,
  clipBehavior: Clip.hardEdge,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  focusElevation: 16,
  focusColor: myColorSchemes.secondary,
  hoverColor: myColorSchemes.secondaryVariant,
  animationDuration: const Duration(seconds: 4),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  autofocus: true,
  minWidth: 12,
  height: 12,
  mouseCursor: MouseCursor.defer,
);