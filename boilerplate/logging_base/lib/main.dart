import 'package:flutter/material.dart';
import 'package:logging_base/app/myapp.dart';
import 'package:logging_base/app/shared/logging_strategies.dart';

void mainDelegate() => main();

final myLogger = CoreAppLogger().appLogger;

void main() {
  

  myLogger.info("app initialized");
  runApp(const MyApp());
}
