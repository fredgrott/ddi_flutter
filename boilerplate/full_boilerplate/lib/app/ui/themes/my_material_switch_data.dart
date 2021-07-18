// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:full_boilerplate/app/ui/themes/my_color_scheme.dart';

MaterialSwitchData myMaterialSwitchData = MaterialSwitchData(
  widgetKey: const Key('switch'),
  activeColor: MyColorScheme.primaryVariant,
  dragStartBehavior: DragStartBehavior.down,
  activeTrackColor: MyColorScheme.secondary,
  inactiveThumbColor: Colors.grey,
  inactiveTrackColor: Colors.grey,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  focusColor: MyColorScheme.primaryVariant,
  hoverColor: MyColorScheme.secondary,
  autofocus: true,
  mouseCursor: MouseCursor.defer,
  splashRadius: 12,
  );