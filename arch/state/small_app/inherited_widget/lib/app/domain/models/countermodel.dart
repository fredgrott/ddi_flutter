// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Just a simple model, we do not have any real entities or use cases
// as its just a one property thing. When we get to multiple
// properties and multiple model classes then we get to
// repository patterns to mediate between domain models and
// how we want to form our data layer for our view-models.

import 'package:inherited_widget/app/domain/entities/icounter.dart';
import 'package:inherited_widget/app/shared/logging_strategies.dart';

final myLogger = CoreAppLogger().appLogger;

class CounterModel with ICounter {
  late int counter;

  CounterModel({required this.counter});

  @override
  int increment() {
    myLogger.info('$counter increment by one');

    return counter++;
  }
}
