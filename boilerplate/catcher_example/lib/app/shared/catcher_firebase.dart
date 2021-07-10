// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:catcher/model/platform_type.dart';
import 'package:catcher/model/report.dart';
import 'package:catcher/model/report_handler.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';



class CrashlyticsHandler extends ReportHandler {
  final Logger _logger = Logger("CrashlyticsHandler");
  final bool enableDeviceParameters;
  final bool enableApplicationParameters;
  final bool enableCustomParameters;
  final bool printLogs;
  CrashlyticsHandler(
      {this.enableDeviceParameters = true,
      this.enableApplicationParameters = true,
      this.enableCustomParameters = true,
      this.printLogs = true})
      // ignore: unnecessary_null_comparison
      : assert(enableDeviceParameters != null,
            // ignore: unnecessary_null_comparison
            "enableDeviceParameters can't be null"),
        // ignore: unnecessary_null_comparison
        assert(enableApplicationParameters != null,
            "enableApplicationParameters can't be null"),
        // ignore: unnecessary_null_comparison
        assert(enableCustomParameters != null,
            "enableCustomParameters can't be null"),
        // ignore: unnecessary_null_comparison
        assert(printLogs != null, "printLogs can't be null");
  @override
  List<PlatformType> getSupportedPlatforms() {
    return [PlatformType.android, PlatformType.iOS];
  }

  
  @override
  Future<bool> handle(Report report, BuildContext? context) async {
    try {
      _printLog("Sending crashlytics report");
      final crashlytics = FirebaseCrashlytics.instance;
      crashlytics.setCrashlyticsCollectionEnabled(true);
      crashlytics.log(_getLogMessage(report));
      if (report.errorDetails != null) {
        // ignore: cast_nullable_to_non_nullable
        await crashlytics.recordFlutterError(report.errorDetails as FlutterErrorDetails);
      } else {
        await crashlytics.recordError(report.error, report.stackTrace as StackTrace);
      }
      _printLog("Crashlytics report sent");
      return true;
    } catch (exception) {
      _printLog("Failed to send crashlytics report: $exception" );
      return false;
    }
  }

  String _getLogMessage(Report report) {
    // ignore: avoid_redundant_argument_values
    final StringBuffer buffer = StringBuffer("");
    if (enableDeviceParameters) {
      buffer.write("||| Device parameters ||| ");
      for (final entry in report.deviceParameters.entries) {
        buffer.write("${entry.key}: ${entry.value} ");
      }
    }
    if (enableApplicationParameters) {
      buffer.write("||| Application parameters ||| ");
      for (final entry in report.applicationParameters.entries) {
        buffer.write("${entry.key}: ${entry.value} ");
      }
    }
    if (enableCustomParameters) {
      buffer.write("||| Custom parameters ||| ");
      for (final entry in report.customParameters.entries) {
        buffer.write("${entry.key}: ${entry.value} ");
      }
    }
    return buffer.toString();
  }

  void _printLog(String log) {
    if (printLogs) {
      _logger.info(log);
    }
  }
}

