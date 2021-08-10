// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


String myAppTitle = "LoggingBuildMode Base";

String catcherEmailAddyOne = "email1@email.com";

String catcherEmailAddyTwo = "email2@email.com";

late Directory externalDir;

String catcherScreenShots = myCatcherScreenShotPath() as String;

Future<String> myCatcherScreenShotPath() async {
  if (Platform.isAndroid || Platform.isIOS || Platform.isFuchsia) {
    // ignore: cast_nullable_to_non_nullable
    externalDir = await getExternalStorageDirectory() as Directory;
  }
  if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
    externalDir = await getApplicationDocumentsDirectory();
  }

  // ignore: unused_local_variable
  String path = "";

  return path = externalDir.path.toString();
}
