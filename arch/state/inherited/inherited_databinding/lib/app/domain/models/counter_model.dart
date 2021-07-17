// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

class CounterModel {
  const CounterModel({this.value = 0});

  final int value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    // ignore: test_types_in_equals
    final CounterModel otherModel = other as CounterModel;

    return otherModel.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
