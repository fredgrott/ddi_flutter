// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



// its our service layer which means since its mediating the domain  it belongs here
import 'package:responsive/app/domain/models/count_model.dart';

extension CountModelX on CountModel {
  // ignore: unnecessary_this
  int increment() => this.count;
}
