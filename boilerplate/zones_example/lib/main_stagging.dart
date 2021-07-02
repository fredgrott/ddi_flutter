// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:zones_example/app/shared/constants.dart';
import 'package:zones_example/main.dart';

// Note you can access static via ClassName().staticMember


void main() {
  Constants().setEnvironment(Environment.stagging);
  mainDelegate();
}
