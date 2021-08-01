// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:setstate_bloc/app/domain/binders/bloc.dart';

extension ReadContext on BuildContext {
  /// Obtain a value from the nearest ancestor provider of type [T].
  ///
  Bloc? read<T extends Bloc>() {
    return Bloc.of<T>();
  }
}
