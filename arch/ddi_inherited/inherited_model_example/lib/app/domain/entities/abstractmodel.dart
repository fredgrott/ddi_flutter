// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:inherited_model_example/app/domain/binders/imodel.dart';

abstract class AbstractModel extends IModel {
  int get counter;
  void increment();
}
