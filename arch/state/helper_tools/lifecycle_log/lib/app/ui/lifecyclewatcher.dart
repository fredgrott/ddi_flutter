// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:lifecycle_log/app/shared/app_vars.dart';
import 'package:lifecycle_log/app/shared/logging_strategies.dart';
import 'package:lifecycle_log/app/ui/home/myhomepage.dart';

final myLogger = CoreAppLogger().appLogger;

/// Based on the one from the Flutter Framework SDK, see:
/// https://github.com/flutter/flutter/blob/master/examples/layers/services/lifecycle.dart
///
/// Modified to log events to logging infrastructure and return the underlying myapp widgets
/// upon build.
///
/// @author Fredrick Allan Grott
class LifecycleWatcher extends StatefulWidget {
  const LifecycleWatcher({Key? key}) : super(key: key);

  @override
  _LifecycleWatcherState createState() => _LifecycleWatcherState();
}

class _LifecycleWatcherState extends State<LifecycleWatcher>
    with WidgetsBindingObserver {
  // ignore: unused_field
  late AppLifecycleState _lastLifecycleState;

  @override
  void initState() {
    super.initState();
    myLogger.info("init state");
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    myLogger.info("dispose state");
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    myLogger.info("$state.toString() changed");
    setState(() {
      _lastLifecycleState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyHomePage(
      title: appTitle,
    );
  }
}
