import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:zones_example/app/myapp.dart';

import 'package:zones_example/app/shared/build_modes.dart';
import 'package:zones_example/app/shared/constants.dart';
import 'package:zones_example/app/shared/logging_strategies.dart';

// This works as the main function in say main_dev.dart
// redirects to this mainDelegate() function and
// thus dart is able to pick this up via the cmd-line
// compile(run) -t main_dev.dart
void mainDelegate() => main();

final myLogger = CoreAppLogger().appLogger;

// ignore: prefer_void_to_null
Future<Null> main() async {
  // an internal FlutterError reporter that dumps to console
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (isInDebugMode) {
      // In development mode simply print to console.
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode report to the application zone to report to
      // app exceptions provider. We do not need this in Profile mode.
      // ignore: no-empty-block
      if (isInReleaseMode) {
        // FlutterError class has something not changed as far as null safety
        // so I just assume we do not have a stack trace but still want the
        // detail of the exception.
        // ignore: cast_nullable_to_non_nullable
        Zone.current.handleUncaughtError(
          // ignore: cast_nullable_to_non_nullable
          details.exception,
          // ignore: cast_nullable_to_non_nullable
          details.stack as StackTrace,
        );
      }
    }
  };

  // ignore: prefer_void_to_null
  runZonedGuarded<Future<Null>>(
    () async {
      //Since we start another zone we need to
      //ensure that SkyEngine has fully loaded Flutter
      // and it needs to be called here to enable grabbing the errors
      WidgetsFlutterBinding.ensureInitialized();
      // Service and other initializations here

      myLogger.info('app initialized');

      runApp(const MyApp());
    },
    // ignore: no-empty-block
    (Object error, StackTrace stack) {
      log('$error.runtimeType $stack');
    },
    zoneSpecification: ZoneSpecification(
      // Intercept all print calls
      print: (self, parent, zone, line) async {
        // Include a timestamp and the name of the App
        final messageToLog = "[${DateTime.now()}] $myAppTitle $line $zone";

        // Also print the message in the "Debug Console"
        // but it's ony an info message and contains no
        // privacy prohibited stuff
        parent.print(zone, messageToLog);
      },
    ),
  );
}
