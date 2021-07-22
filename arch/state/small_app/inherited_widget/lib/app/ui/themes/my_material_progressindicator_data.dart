// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:inherited_widget/app/ui/themes/my_app_common_theme_vars.dart';
import 'package:inherited_widget/app/ui/themes/my_color_schemes.dart';




MaterialProgressIndicatorData myMaterialProgressIndicatorData = MaterialProgressIndicatorData(
  key: const Key('progressindicator'),
  backgroundColor: myColorSchemes.background,
  strokeWidth: 12,
  value: 12,
  semanticsLabel: '',
  semanticsValue: '',
  color: myButtonColor,
);