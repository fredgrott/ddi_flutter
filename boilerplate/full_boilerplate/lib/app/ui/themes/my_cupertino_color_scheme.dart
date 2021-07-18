// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// In CupertinoApp Widgets we do not have ColorScheme
// and so this is the best approximation. Define
// Primary, PrimaryVariant, Secondary, and SecondaryVariant

CupertinoDynamicColor myCupertinoPrimaryColor =
    const CupertinoDynamicColor.withBrightness(
  color: Colors.purple,
  darkColor: Colors.cyan,
);

CupertinoDynamicColor myCupertinoPrimaryContrastingColor =
    const CupertinoDynamicColor.withBrightness(
      color: Colors.deepPurple, 
      // ignore: prefer-trailing-comma
      darkColor: Colors.deepPurpleAccent);
