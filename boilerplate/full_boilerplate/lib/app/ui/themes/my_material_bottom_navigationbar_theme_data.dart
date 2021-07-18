// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:full_boilerplate/app/ui/themes/my_color_scheme.dart';
import 'package:full_boilerplate/app/ui/themes/my_material_icon_theme_data.dart';

BottomNavigationBarThemeData myMaterialBottomNavigationBarThemeData =
    BottomNavigationBarThemeData(
      elevation: 10,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      enableFeedback: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: MyColorScheme.background,
      selectedIconTheme: myMaterialSelectedIconThemeData,
      unselectedIconTheme: myMaterialUnselectedIconThemeData,
      selectedItemColor: MyColorScheme.primaryVariant,
      unselectedItemColor: MyColorScheme.secondary,
      unselectedLabelStyle: myUnselectedLabelStyle,
      selectedLabelStyle: mySelectedLabelStyle,
    );


TextStyle myUnselectedLabelStyle = TextStyle();

TextStyle mySelectedLabelStyle = TextStyle();