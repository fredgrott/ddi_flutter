// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:intl/intl.dart';

class AppLocaleServices {
  AppLocaleServices();

  Future<String> getLocale() async {
    return Intl.getCurrentLocale();
  }
}
