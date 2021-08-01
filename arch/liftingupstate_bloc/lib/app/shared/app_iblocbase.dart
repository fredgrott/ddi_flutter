// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

abstract class IBlocBase {
  /// Anything extending the [BlocBase] must implement the dispose method
  /// Used to dispose the [StreamController]s that are used in [bloc]s
  void dispose();
}