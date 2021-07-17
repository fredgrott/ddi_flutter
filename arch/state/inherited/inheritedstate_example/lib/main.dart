import 'package:flutter/material.dart';
import 'package:inherited_state/inherited_state.dart';
import 'package:inheritedstate_example/app/my_app.dart';

import 'package:inheritedstate_example/app/shared/logging_strategies.dart';
import 'package:inheritedstate_example/registerdependencies.dart';





void mainDelegate() => main();

final myLogger = CoreAppLogger().appLogger;

void main() {
  
  // ignore: avoid_redundant_argument_values
  ServiceLocator.config = const ServiceLocatorConfig(throwOnUnregisered: false);
  registerDependencies();

  myLogger.info("app initialized");
  runApp(MyApp());
}
