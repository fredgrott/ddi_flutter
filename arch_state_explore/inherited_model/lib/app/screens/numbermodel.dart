// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';

enum NUMBER_TYPE {
  first,
  second,
  third,
}

class NumberModel extends InheritedModel<NUMBER_TYPE> {
  final int firstValue, secondValue, thirdValue;

  const NumberModel({
    required this.firstValue,
    required this.secondValue,
    required this.thirdValue,
    required Widget child,
  }) : super(child: child);

  static NumberModel? of(BuildContext context, {required NUMBER_TYPE aspect}) {
    return InheritedModel.inheritFrom<NumberModel>(context, aspect: aspect);
  }

  Widget getLabeledText(NUMBER_TYPE type) {
    switch (type) {
      case NUMBER_TYPE.first:
        return Text('First Number: $firstValue');
      case NUMBER_TYPE.second:
        return Text('Second Number: $secondValue');
      case NUMBER_TYPE.third:
        return Text('Third Number: $thirdValue');
    }

    // ignore: dead_code
    return Text('Unknown Number Type $type');
  }

  @override
  bool updateShouldNotify(NumberModel old) {
    return firstValue != old.firstValue ||
        secondValue != old.secondValue ||
        thirdValue != old.thirdValue;
  }

  @override
  bool updateShouldNotifyDependent(NumberModel old, Set<NUMBER_TYPE> aspects) {
    return (aspects.contains(NUMBER_TYPE.first) &&
            old.firstValue != firstValue) ||
        (aspects.contains(NUMBER_TYPE.second) &&
            old.secondValue != secondValue) ||
        (aspects.contains(NUMBER_TYPE.third) && old.thirdValue != thirdValue);
  }
}
