import 'package:flutter/material.dart';

import 'package:inherited_bloc/app/shared/logging_strategies.dart';

import 'app/my_app.dart';





void mainDelegate() => main();

final myLogger = CoreAppLogger().appLogger;

void main() {
  

  myLogger.info("app initialized");
  runApp(MyApp());
}
