// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:full_boilerplate/app/ui/themes/my_color_schemes.dart';

MaterialIconButtonData myMaterialIconButtonData = MaterialIconButtonData(
  widgetKey: const Key('iconbutton'),
  padding: EdgeInsets.zero,
  color: myColorSchemes.primary,
  disabledColor: Colors.grey,
  highlightColor: myColorSchemes.primaryVariant,
  iconSize: 12,
  splashColor: myColorSchemes.secondary,
  tooltip: '',
  focusColor: myColorSchemes.secondaryVariant,
  hoverColor: myColorSchemes.secondary,
  autofocus: true,
  enableFeedback: true,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  constraints: const BoxConstraints.expand(),
  splashRadius: 44,
  mouseCursor: MouseCursor.defer,
  alignment: AlignmentDirectional.bottomCenter,
);