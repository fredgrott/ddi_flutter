import 'package:flutter/material.dart';
import 'package:inherited_widget/app/myapp.dart';
import 'package:inherited_widget/app/shared/logging_strategies.dart';




void mainDelegate() => main();

final myLogger = CoreAppLogger().appLogger;

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  

  myLogger.info("app initialized");
  runApp(const MyApp());
}
