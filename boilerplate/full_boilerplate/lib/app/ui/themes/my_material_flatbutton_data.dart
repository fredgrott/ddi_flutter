// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:full_boilerplate/app/ui/themes/my_color_scheme.dart';

MaterialFlatButtonData myMaterialFlatButtonData = MaterialFlatButtonData(
  widgetKey: const Key('flatbutton'),
  color: MyColorScheme.primary,
  padding: EdgeInsetsGeometry.infinity,
  disabledColor: Colors.grey,
  disabledElevation: 4,
  disabledTextColor: Colors.black12,
  elevation: 10,
  highlightColor: MyColorScheme.primaryVariant,
  highlightElevation: 14,
  splashColor: MyColorScheme.secondary,
  textColor: MyColorScheme.secondaryVariant,
  clipBehavior: Clip.hardEdge,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  focusElevation: 16,
  focusColor: MyColorScheme.secondary,
  hoverColor: MyColorScheme.secondaryVariant,
);