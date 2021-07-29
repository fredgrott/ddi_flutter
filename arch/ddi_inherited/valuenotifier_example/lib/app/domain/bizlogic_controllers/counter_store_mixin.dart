// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

class CounterStoreMixin {
  static const int _counter = 0;

  int myCounter = _counter;

  int increaseCounter() {
    return myCounter++;
  }
}

