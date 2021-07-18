// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

CupertinoFilledButtonData myCupertinoFilledButtonData =
    CupertinoFilledButtonData(
      widgetKey: const Key('filledbutton'),
      padding: EdgeInsetsGeometry.infinity,
      disabledColor: CupertinoColors.inactiveGray,
      borderRadius: BorderRadius.zero,
      minSize: 12,
      pressedOpacity: 10,
      
    );
