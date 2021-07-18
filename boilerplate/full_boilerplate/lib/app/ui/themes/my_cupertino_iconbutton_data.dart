// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:full_boilerplate/app/ui/themes/my_color_scheme.dart';

CupertinoIconButtonData myCupertinoIconButtonData = CupertinoIconButtonData(
  widgetKey: const Key('iconbutton'),
  padding: EdgeInsets.zero,
  color: MyColorScheme.primary,
  disabledColor: Colors.grey,
  minSize: 22,
  pressedOpacity: 10,
  
);