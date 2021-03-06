// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:bloc_cubit/app/ui/themes/my_app_textstyles.dart';
import 'package:bloc_cubit/app/ui/themes/my_color_schemes.dart';
import 'package:flutter/material.dart';




TimePickerThemeData myMaterialTimePickerThemeData = TimePickerThemeData(
  backgroundColor: myColorSchemes.background,
  hourMinuteColor: myColorSchemes.primary,
  hourMinuteTextColor: myColorSchemes.primaryVariant,
  dayPeriodColor: myColorSchemes.secondary,
  dayPeriodTextColor: myColorSchemes.secondaryVariant,
  dialBackgroundColor: myColorSchemes.primaryVariant,
  dialTextColor: myColorSchemes.primary,
  dialHandColor: myColorSchemes.secondary,
  entryModeIconColor: myColorSchemes.secondaryVariant,
  helpTextStyle: myTimePickerHelpTextStyle,
  hourMinuteTextStyle: myTimePickerHourTextStyle,
  dayPeriodTextStyle: myTimePickerDayTextStyle,
);