import 'package:flutter/material.dart';
import 'package:inherited_databinding/app/my_app.dart';

import 'package:inherited_databinding/app/shared/logging_strategies.dart';





void mainDelegate() => main();

final myLogger = CoreAppLogger().appLogger;

void main() {
  

  myLogger.info("app initialized");
  runApp(MyApp());
}
