import 'package:flutter/material.dart';
import 'package:inherited_widget/app/myapp.dart';
import 'package:inherited_widget/app/shared/logging_strategies.dart';




void mainDelegate() => myMainDelegate();

final myLogger = CoreAppLogger().appLogger;

void myMainDelegate() {
  

  myLogger.info("app initialized");
  runApp(const MyApp());
}
