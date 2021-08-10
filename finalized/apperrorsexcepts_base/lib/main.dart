import 'dart:async';

import 'package:apperrorsexcepts_base/appvars.dart';
import 'package:apperrorsexcepts_base/buildmodes.dart';
import 'package:apperrorsexcepts_base/catcher.dart';
import 'package:apperrorsexcepts_base/logging.dart';
import 'package:apperrorsexcepts_base/myapp.dart';
import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';



// ignore: prefer_void_to_null
Future<Null> main() async {
  // ensure that the Flutter SkyEngine has fully initialized
  WidgetsFlutterBinding.ensureInitialized();
  initLogger();
  appLogger.info('initialized');

  FlutterError.onError = (FlutterErrorDetails details) async {
    if (isInDebugMode) {
      // In development mode simply print to console.
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode report to the application zone to report to
      // app exceptions provider. We do not need this in Profile mode.
      if (isInReleaseMode) {

        Zone.current.handleUncaughtError(
            // ignore: cast_nullable_to_non_nullable
            details.exception, details.stack as StackTrace,);
        //Zone.current.handleUncaughtError(details.exception,  details.stack);
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

      // To allow Catcher reports to work
      final GlobalKey<NavigatorState> navigatorKey =
          GlobalKey<NavigatorState>();

          Catcher(
        rootWidget: MyApp(navigatorKey),
        debugConfig: debugOptions,
        releaseConfig: releaseOptions,
        navigatorKey: navigatorKey,
      );



      },
      // ignore: no-empty-block
    (Object error, StackTrace stack) {
      // myBackend.sendError(error, stack);
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
