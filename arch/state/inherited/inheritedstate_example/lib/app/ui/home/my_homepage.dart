// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inherited_state/inherited_state.dart';
import 'package:inheritedstate_example/app/domain/models/counter.dart';
import 'package:inheritedstate_example/app/domain/repositories/counterservice.dart';
import 'package:inheritedstate_example/app/domain/repositories/testservice.dart';
import 'package:inheritedstate_example/app/shared/logging_strategies.dart';

final myLogger = CoreAppLogger().appLogger;


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final counterService = SL.get<CounterService>()!;
  final testService = SL.get<TestService>()!;
  late Future<int> initialCounterFuture;

  @override
  void initState() {
    super.initState();
    initialCounterFuture = counterService.getInitialCounter();
    // Long form
    // initialCounterFuture.then((value) =>
    //     ReactiveService.getReactive<Counter>().setState((counter) => counter.count = value));
    // Short form - Mutable update
    initialCounterFuture.then<dynamic>((value) =>
        RS.set<Counter>(context, (counter) => counter.count = value));
  }

  void _incrementCounter() {
    // Immutable update (creates a new instance)
    final result = RS.set<Counter>(
      context,
      (obj) => Counter(count: obj.count + 1),
    );

    // Mutable update (reuses same instance)
    // final result = context.dispatch<Counter>(
    //   (obj) => obj.count += 1,
    // );

    myLogger.info('increment result: $result / #code: ${result.hashCode}');
  }

  @override
  Widget build(BuildContext context) {
    // shortcut api
    // final counter = RS.get<Counter>(context);

    // extensions api
    final counter = context.on<Counter>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(height: 20),
            _buildFutureWaiter(
                (isReady) => Text(
                      '${counter.count}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                true,),
          ],
        ),
      ),
      floatingActionButton: _buildFutureWaiter(
        (isReady) {
          return FloatingActionButton(
            backgroundColor: isReady ? null : Colors.grey,
            disabledElevation: 0,
            onPressed: isReady ? _incrementCounter : null,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }

  Widget _buildFutureWaiter(Widget Function(bool isReady) builder,
          [bool showSpinner = false,]) =>
      FutureBuilder<int>(
        future: initialCounterFuture,
        builder: (_, snapshot) => showSpinner && !snapshot.hasData
            ? const CircularProgressIndicator()
            : builder(snapshot.hasData),
      );
}