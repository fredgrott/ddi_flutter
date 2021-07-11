// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from Flutter Portal code, original under 
// MIT license and modifications under BSD license.


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:overlay_two/app/shared/my_portal.dart';
import 'package:overlay_two/app/widgets/modal.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showModal = false;

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Discovery example')),
          body: Center(
            child: Modal(
              visible: showModal,
              modal: const Dialog(
                child: Text('Hello world'),
              ),
              onClose: () => setState(() => showModal = false),
              child: ElevatedButton(
                onPressed: () => setState(() => showModal = true),
                child: const Text('Show modal'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
