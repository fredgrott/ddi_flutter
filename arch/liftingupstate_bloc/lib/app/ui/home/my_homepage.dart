// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:liftingupstate_bloc/app/domain/bizlogic_controllers/counter_store_mixin.dart';
import 'package:liftingupstate_bloc/app/shared/app_vars.dart';
import 'package:liftingupstate_bloc/app/ui/themes/my_cupertino_iconbutton_data.dart';
import 'package:liftingupstate_bloc/app/ui/themes/my_cupertino_navigation_bar_data.dart';
import 'package:liftingupstate_bloc/app/ui/themes/my_cupertino_page_scaffold_data.dart';
import 'package:liftingupstate_bloc/app/ui/themes/my_material_app_bar_data.dart';
import 'package:liftingupstate_bloc/app/ui/themes/my_material_iconbutton_data.dart';
import 'package:liftingupstate_bloc/app/ui/themes/my_material_scaffold_data.dart';




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

class MyHomePageState extends State<MyHomePage> with CounterStoreMixin {
  void incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      increaseCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
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
              backgroundColor: Colors.transparent,
              title: PlatformText(myAppTitle, key: const Key('title'), textAlign: TextAlign.center, semanticsLabel: "app title",),
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
                  material: (_,__) => myMaterialIconButtonData,
                  cupertino: (_, __) => myCupertinoIconButtonData,

                  // ignore: no-empty-block
                  onPressed: () {},
                ),
              ],
            ),
            body: Stack(children: <Widget>[
              Card(child:Center(
                  // ignore: prefer-trailing-comma
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  PlatformText("increment", key: const Key('text'), textAlign: TextAlign.center, softWrap: true, overflow: TextOverflow.clip, textScaleFactor: 1.0, maxLines: 2, semanticsLabel: 'increment the counter',),
                  PlatformText(
                    '$myCounter', key: const Key('text'), textAlign: TextAlign.center, softWrap: true, overflow: TextOverflow.clip, textScaleFactor: 1.0, maxLines: 1, semanticsLabel: 'counter value',
                  ),
                ],
              ),), ),
              
              Positioned(
                  bottom: 54,
                  right: 34,
                  // ignore: prefer-trailing-comma
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // ignore: prefer-trailing-comma
                      children: <Widget>[
                        PlatformIconButton(
                          key: const Key('increment'),
                          onPressed: () {
                            incrementCounter();
                          },
                          //padding: EdgeInsets.zero,
                          icon: Icon(context.platformIcons.addCircledSolid),
                          material: (_, __) => myMaterialIconButtonData,
                          cupertino: (_, __) => myCupertinoIconButtonData,
                        ),
                      ],),),
            ],),),);
  }
}


