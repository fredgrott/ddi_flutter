// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:inherited_widget/app/domain/binders/counter_update.dart';
import 'package:inherited_widget/app/domain/binders/model.dart';
import 'package:inherited_widget/app/domain/models/counter_model.dart';
import 'package:inherited_widget/app/shared/app_vars.dart';
import 'package:inherited_widget/app/ui/home/counter_actions.dart';
import 'package:inherited_widget/app/ui/home/counter_display.dart';
import 'package:inherited_widget/app/ui/themes/my_cupertino_iconbutton_data.dart';
import 'package:inherited_widget/app/ui/themes/my_cupertino_navigation_bar_data.dart';
import 'package:inherited_widget/app/ui/themes/my_cupertino_page_scaffold_data.dart';
import 'package:inherited_widget/app/ui/themes/my_material_app_bar_data.dart';
import 'package:inherited_widget/app/ui/themes/my_material_iconbutton_data.dart';
import 'package:inherited_widget/app/ui/themes/my_material_scaffold_data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, this.message = ""})
      : super(key: key);

  final String title;
  final String message;

  static const Key titleKey = Key('title');
  static const Key messageKey = Key('message');


  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final model = CounterModel();
  @override
  Widget build(BuildContext context) {
    return Model<CounterModel>(
      key: const Key('model'),
      value: model,
      child: NotificationListener<CounterUpdate>(
        onNotification: (notification) {
          if (mounted) {
            setState(() {
              model.counter = notification.value;
            });
          }

          return true;
        },
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
            title: PlatformText(
              myAppTitle,
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
                    CounterDisplay(),
                    Positioned(
                      bottom: 54,
                      right: 34,
                      // ignore: prefer-trailing-comma
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // ignore: prefer-trailing-comma
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          const CounterActions(
                            key: Key('counter'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
