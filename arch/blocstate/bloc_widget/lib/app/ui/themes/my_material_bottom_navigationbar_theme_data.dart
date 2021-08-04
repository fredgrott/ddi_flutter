// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:bloc_widget/app/ui/themes/my_app_textstyles.dart';
import 'package:bloc_widget/app/ui/themes/my_color_schemes.dart';
import 'package:bloc_widget/app/ui/themes/my_material_icon_theme_data.dart';
import 'package:flutter/material.dart';



BottomNavigationBarThemeData myMaterialBottomNavigationBarThemeData =
    BottomNavigationBarThemeData(
      elevation: 10,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      enableFeedback: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: myColorSchemes.background,
      selectedIconTheme: myMaterialSelectedIconThemeData,
      unselectedIconTheme: myMaterialUnselectedIconThemeData,
      selectedItemColor: myColorSchemes.primaryVariant,
      unselectedItemColor: myColorSchemes.secondary,
      unselectedLabelStyle: myUnselectedLabelStyle,
      selectedLabelStyle: mySelectedLabelStyle,
    );


