// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from Flutter Portal code, original under 
// MIT license and modifications under BSD license.


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:overlay_five/app/screens/contextualmenu_example.dart';
import 'package:overlay_five/app/shared/my_portal.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Example'),
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: const ContextualMenuExample(),
          ),
        ),
      ),
    );
  }
}
