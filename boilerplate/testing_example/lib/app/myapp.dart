// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.




import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testing_example/app/screens/home/myhomepage.dart';
import 'package:testing_example/app/shared/app_vars.dart';

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const MyApp({Key? key, required this.navigatorKey}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: unnecessary_this
      navigatorKey: this.navigatorKey,
      title: myAppTitle,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //builder: (BuildContext context, Widget? widget) {
        //Catcher.addDefaultErrorWidget(
            // ignore: avoid_redundant_argument_values
           // showStacktrace: true,
            //title: "Error Report",
            //description: "Error description",
            // ignore: avoid_redundant_argument_values
            //maxWidthForSmallMode: 150,);

        //return widget!;
      //},
      home: MyHomePage(title:myAppTitle, message: '',),
    );
  }
}
