// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.






import 'package:inherited_databinding/app/shared/constants.dart';
import 'package:inherited_databinding/main.dart';

void main() {
  Constants().setEnvironment(Environment.staging);
  mainDelegate();
}

