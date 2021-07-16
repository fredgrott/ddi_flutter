// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:lifecycle_log/app/shared/logging_strategies.dart';

final myLogger = CoreAppLogger().appLogger;

/// Modification of LifecycleReactor example from WidgetsBindingObserver class
/// docs, see: https://api.flutter.dev/flutter/widgets/WidgetsBindingObserver-class.html
///
/// Uses a basic logging infrastructure to log state events to log level of info
///
/// Simplifies usage to just extending this base class.
/// Note that we do push() and pushNamed() for pushing nav routes and that
/// if using Flutter Platform Widgets plugins then this needs a rewrite
/// to account for the way FPW handles nav differences between Material
/// and Cupertino Apps.
///
/// @author Fredrick Allan Grott
abstract class LifecycleStatefulReactor<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver {
  
  

  late AppLifecycleState lastAppState;

  // ignore: no-empty-block

  @override
  void initState() {
    super.initState();
    myLogger.info('state initialized');
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    myLogger.info('state disposed');
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    myLogger.info('state changed: $state.toString()');
    lastAppState = state;
  }

  

  
}

