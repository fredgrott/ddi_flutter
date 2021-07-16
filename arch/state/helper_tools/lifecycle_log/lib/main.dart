import 'package:flutter/material.dart';
import 'package:lifecycle_log/app/myapp.dart';

import 'package:lifecycle_log/app/shared/logging_strategies.dart';



void mainDelegate() => myMainDelegate();

final myLogger = CoreAppLogger().appLogger;

void myMainDelegate() {
  

  myLogger.info("app initialized");
  runApp(const MyApp());
}
