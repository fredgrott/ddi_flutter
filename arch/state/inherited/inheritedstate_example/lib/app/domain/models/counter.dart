// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



class Counter {
  Counter({this.count = 0});
  int count;

  @override
  String toString() {
    return 'Counter($count)';
  }
}
