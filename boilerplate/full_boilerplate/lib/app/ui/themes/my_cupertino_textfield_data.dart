// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';

CupertinoTextField myCupertinoTextFieldData = const CupertinoTextField(
  key: Key('textfield'),
  padding: EdgeInsetsGeometry.infinity,
  placeholder: '',
  // ignore: avoid_redundant_argument_values
  prefixMode: OverlayVisibilityMode.always,
  // ignore: avoid_redundant_argument_values
  suffixMode: OverlayVisibilityMode.always,
  clearButtonMode: OverlayVisibilityMode.always,
  keyboardType: TextInputType.numberWithOptions(),
  textInputAction: TextInputAction.done,
  textCapitalization: TextCapitalization.words,
  textAlign: TextAlign.center,
  // ignore: avoid_redundant_argument_values
  readOnly: false,
  toolbarOptions: ToolbarOptions(copy: true),
  showCursor: true,
  autofocus: true,
  obscuringCharacter: '*',
  obscureText: true,
  // ignore: avoid_redundant_argument_values
  autocorrect: true,
  smartDashesType: SmartDashesType.enabled,
  smartQuotesType: SmartQuotesType.enabled,
);