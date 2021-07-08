import 'package:flutter/material.dart';
import 'package:logging_base/app/myapp.dart';
import 'package:logging_base/app/shared/logging_strategies.dart';

void mainDelegate() => myMainDelegate();

final myLogger = CoreAppLogger().appLogger;

void myMainDelegate() {
  

  myLogger.info("app initialized");
  runApp(const MyApp());
}
