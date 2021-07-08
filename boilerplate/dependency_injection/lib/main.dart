import 'package:dependency_injection/app/myapp.dart';
import 'package:dependency_injection/app/shared/di_instances.dart';

import 'package:dependency_injection/app/shared/logging_appexceptions.dart';
import 'package:dependency_injection/app/shared/logging_appinitlog.dart';
import 'package:flutter/material.dart';

void mainDelegate() => myMainDelegate();

void myMainDelegate() {
  // initialize the logger for the app
  tryFunction(appInitLog);

  // for DI debugging
  // no matter if using plain factory DI or Service locator DI you should 
  // as a matter of best practices debug log your DI injections
  logInstance.getLogger().info(logInstance.diID);
  logInstance.getLogger().info(appPropertiesInstance.diID);

  // inject my app dependencies

  // log some info using the app logger
  //myAppLogger.info("app initialized");

  runApp(const MyApp());
}
