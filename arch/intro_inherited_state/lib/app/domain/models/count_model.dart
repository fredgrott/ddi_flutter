// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:intro_inherited_state/app/domain/entities/icount.dart';

class CountModel implements ICount {
  CountModel({this.count = 0});

  @override
  late int count;

  @override
  String toString() {
    
    return 'Counter($count)';
  }
}
