import 'package:flutter/material.dart';
import 'package:service_loc_example/app/myapp.dart';
import 'package:service_loc_example/app/shared/logging_appexceptions.dart';
import 'package:service_loc_example/app/shared/logging_appinitlog.dart';

void mainDelegate() => myMainDelegate();

void myMainDelegate() {
  // initialize the logger for the app
  tryFunction(appInitLog);

  

  // inject my app dependencies

  // log some info using the app logger
  //myAppLogger.info("app initialized");

  runApp(const MyApp());
}
