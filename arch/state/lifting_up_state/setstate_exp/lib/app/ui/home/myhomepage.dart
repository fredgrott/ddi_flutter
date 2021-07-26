// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:setstate_exp/app/domain/models/count_model.dart';
import 'package:setstate_exp/app/domain/repositories/app_config.dart';
import 'package:setstate_exp/app/domain/repositories/app_counter_service.dart';
import 'package:setstate_exp/app/domain/repositories/app_test_service.dart';
import 'package:setstate_exp/app/shared/app_di_state_inheritedstate.dart';
import 'package:setstate_exp/app/shared/app_di_state_servicelocator.dart';
import 'package:setstate_exp/app/ui/themes/my_color_schemes.dart';
import 'package:setstate_exp/app/ui/themes/my_cupertino_iconbutton_data.dart';
import 'package:setstate_exp/app/ui/themes/my_cupertino_navigation_bar_data.dart';
import 'package:setstate_exp/app/ui/themes/my_cupertino_page_scaffold_data.dart';
import 'package:setstate_exp/app/ui/themes/my_material_app_bar_data.dart';
import 'package:setstate_exp/app/ui/themes/my_material_iconbutton_data.dart';
import 'package:setstate_exp/app/ui/themes/my_material_scaffold_data.dart';

final appConfig = SL.get<AppConfig>()!;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, this.message = ""})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String message;

  static const Key titleKey = Key('MyWidget.title');
  static const Key messageKey = Key('MyWidget.message');

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final counterService = SL.get<AppCounterService>()!;
  final testService = SL.get<AppTestService>()!;
  late Future<int> initialCounterFuture;

  @override
  void initState() {
    super.initState();
    initialCounterFuture = counterService.getInitialCounter();
    // Long form
    // initialCounterFuture.then((value) =>
    //     ReactiveService.getReactive<Counter>().setState((counter) => counter.count = value));
    // Short form - Mutable update
    initialCounterFuture.then<int>((value) => RS.set<CountModel>(
        context, (dynamic counter) => counter.count = value,) as int);
  }

  void _incrementCounter() {
    // Immutable update (creates a new instance)
    final result = RS.set<CountModel>(
      context,
      (obj) => CountModel(count: obj.count + 1),
    );

    // Mutable update (reuses same instance)
    // final result = context.dispatch<Counter>(
    //   (obj) => obj.count += 1,
    // );

    log('increment result: $result / #code: ${result.hashCode}');
  }

  @override
  Widget build(BuildContext context) {
    final counter = context.on<CountModel>();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: myColorSchemes.primary,
        systemNavigationBarColor: myColorSchemes.primary,
        systemNavigationBarDividerColor:myColorSchemes.primaryVariant,
      ),
      child: PlatformScaffold(
        material: (
          _,
          __,
        ) =>
            myMaterialScaffoldData,
        cupertino: (
          _,
          __,
        ) =>
            myCupertinoPageScaffoldData,
            appBar: PlatformAppBar(
          backgroundColor: myColorSchemes.primary,
          title: PlatformText(
            widget.title,
            key: const Key('title'),
            textAlign: TextAlign.center,
            semanticsLabel: "app title",
          ),
          material: (
            _,
            __,
          ) =>
              myMaterialAppBarData,
          cupertino: (_, __) => myCupertinoNavigationBarData,
          trailingActions: <Widget>[
            PlatformIconButton(
              //padding: EdgeInsets.zero,

              icon: Icon(context.platformIcons.share),
              //color: Colors.black87,
              material: (_, __) => myMaterialIconButtonData,
              cupertino: (_, __) => myCupertinoIconButtonData,

              // ignore: no-empty-block
              onPressed: () {},
            ),
          ],
        ),
        body: Stack(children: <Widget>[
          Card(
            child: Center(
              // ignore: prefer-trailing-comma
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  PlatformText(
                    "increment",
                    key: const Key('text'),
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                    textScaleFactor: 1.0,
                    maxLines: 2,
                    semanticsLabel: 'increment the counter',
                  ),
                  const SizedBox(height: 20),
                  _buildFutureWaiter(
                      (dynamic isReady) => PlatformText(
                            '${counter.count}',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                      true,),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 54,
            right: 34,
            // ignore: prefer-trailing-comma
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer-trailing-comma
              children: <Widget>[
                
                _buildFutureWaiter(
                  (isReady) {
                    return PlatformIconButton(
                      
                      key: const Key('increment'),
                      onPressed: isReady ? _incrementCounter : null,
                      icon: Icon(context.platformIcons.addCircledSolid),
                      material: (_, __) => myMaterialIconButtonData,
                      cupertino: (_, __) => myCupertinoIconButtonData,
                    );
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildFutureWaiter(
    Widget Function(bool isReady) builder, [
    bool showSpinner = false,
  ]) =>
      FutureBuilder<int>(
        future: initialCounterFuture,
        builder: (_, snapshot) => showSpinner && !snapshot.hasData
            ? const CircularProgressIndicator()
            : builder(snapshot.hasData),
      );
}

 
