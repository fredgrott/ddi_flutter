// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:flutter/cupertino.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:kiwigen_counterapp/app/ui/themes/my_app_common_theme_vars.dart';
import 'package:kiwigen_counterapp/app/ui/themes/my_color_schemes.dart';






CupertinoTabBarData myCupertinoTabBarData = CupertinoTabBarData(
  backgroundColor: CupertinoColors.lightBackgroundGray,
  activeColor: myButtonColor,
  widgetKey: const Key('tabbar'),
  iconSize: 44,
  currentIndex: 1,
  inactiveColor: myDisabledColor,
  border: Border.all( color: myColorSchemes.primaryVariant),
);