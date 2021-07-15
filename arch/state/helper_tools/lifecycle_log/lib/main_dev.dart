// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:lifecycle_log/app/shared/constants.dart';
import 'package:lifecycle_log/main.dart';

void main() {
  Constants().setEnvironment(Environment.dev);
  mainDelegate();
}
