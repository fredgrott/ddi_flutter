// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:full_boilerplate/app/ui/themes/my_color_scheme.dart';

MaterialIconButtonData myMaterialIconButtonData = MaterialIconButtonData(
  widgetKey: const Key('iconbutton'),
  padding: EdgeInsets.zero,
  color: MyColorScheme.primary,
  disabledColor: Colors.grey,
  highlightColor: MyColorScheme.primaryVariant,
  iconSize: 12,
  splashColor: MyColorScheme.secondary,
  tooltip: '',
  focusColor: MyColorScheme.secondaryVariant,
  hoverColor: MyColorScheme.secondary,
  autofocus: true,
  enableFeedback: true,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  constraints: const BoxConstraints.expand(),
  splashRadius: 44,
  mouseCursor: MouseCursor.defer,
);