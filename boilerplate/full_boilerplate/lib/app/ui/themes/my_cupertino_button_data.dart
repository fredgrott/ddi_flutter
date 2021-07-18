// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:full_boilerplate/app/ui/themes/my_cupertino_color_scheme.dart';

CupertinoButtonData myCupertinoButtonData = CupertinoButtonData(
  widgetKey: const Key('button'),
  color: myCupertinoPrimaryColor,
  padding: EdgeInsetsGeometry.infinity,
  disabledColor: CupertinoColors.inactiveGray,
  borderRadius: BorderRadius.zero,
  minSize: 10,
  pressedOpacity: 20,
  
);