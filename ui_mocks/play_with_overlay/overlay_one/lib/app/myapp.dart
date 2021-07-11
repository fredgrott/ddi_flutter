// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from Flutter Portal code, original under
// MIT license and modifications under BSD license.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:overlay_one/app/shared/my_portal.dart';
import 'package:overlay_one/app/widgets/discovery.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showDiscovery = false;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Discovery example')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('You have clicked the button this many times:'),
                Text('$count', style: Theme.of(context).textTheme.headline4),
                ElevatedButton(
                  onPressed: () => setState(() => showDiscovery = true),
                  child: const Text('Show discovery'),
                ),
              ],
            ),
          ),
          floatingActionButton: Discovery(
            visible: showDiscovery,
            description: const Text('Click to increment the counter'),
            onClose: () => setState(() => showDiscovery = false),
            child: FloatingActionButton(
              onPressed: _increment,
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }

  void _increment() {
    setState(() {
      showDiscovery = false;
      count++;
    });
  }
}
