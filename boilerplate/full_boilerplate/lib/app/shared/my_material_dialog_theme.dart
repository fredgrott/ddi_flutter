// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:full_boilerplate/app/shared/my_color_scheme.dart';

DialogTheme myMaterialDialogTheme = DialogTheme(
  backgroundColor: MyColorScheme.background,
  elevation: 12,
  titleTextStyle: myMaterialDialogTitleTextStyle,
  contentTextStyle: myMaterialDialogContentTextStyle,
);

TextStyle myMaterialDialogTitleTextStyle = TextStyle();

TextStyle myMaterialDialogContentTextStyle = TextStyle();