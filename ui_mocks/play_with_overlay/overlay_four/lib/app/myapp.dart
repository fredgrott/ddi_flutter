// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from Flutter Portal code, original under 
// MIT license and modifications under BSD license.


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:overlay_four/app/screens/datepicker_use.dart';
import 'package:overlay_four/app/shared/my_portal.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text('Example')),
          body: LayoutBuilder(
            builder: (_, __) {
              return LayoutBuilder(builder: (_, __) {
                return const DatePickerUsageExample();
              });
            },
          ),
        ),
      ),
    );
  }
}
