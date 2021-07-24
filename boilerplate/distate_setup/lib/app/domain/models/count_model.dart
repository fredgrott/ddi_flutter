// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:distate_setup/app/domain/entities/icount.dart';

class CountModel implements ICount {
  @override
  late int count;

  CountModel(this.count);
}
