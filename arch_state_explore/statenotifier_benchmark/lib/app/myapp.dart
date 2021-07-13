// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:statenotifier_benchmark/app/page.dart';



class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'Idle Sample',
       theme: ThemeData(
         primarySwatch: Colors.blue,
       ),
       home: const MyPage(title: 'Idle Sample', key: Key('idle'),),
     );
   }
}
