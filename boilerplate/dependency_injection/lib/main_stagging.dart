// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:dependency_injection/app/shared/constants.dart';
import 'package:dependency_injection/main.dart';

void main() {
  Constants().setEnvironment(Environment.stagging);
  mainDelegate();
}

