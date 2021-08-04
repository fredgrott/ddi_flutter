// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



// Note you can access static via ClassName().staticMember




import 'package:o_one_bloc_provider/app/shared/constants.dart';
import 'package:o_one_bloc_provider/main.dart';

void main() {
  Constants().setEnvironment(Environment.dev);
  mainDelegate();
}
