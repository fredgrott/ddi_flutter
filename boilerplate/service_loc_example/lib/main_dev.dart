// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:service_loc_example/app/shared/constants.dart';
import 'package:service_loc_example/main.dart';

void main() {
  Constants().setEnvironment(Environment.dev);
  mainDelegate();
}
