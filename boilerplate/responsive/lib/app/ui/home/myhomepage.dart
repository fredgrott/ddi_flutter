// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// As we move up on the powerful and complex state management solutions
// we can then get away with using stateless as the biz logic
// to set the mutable is no longer in the UI-widget.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:responsive/app/domain/binders/injected_count.dart';
import 'package:responsive/app/shared/app_vars.dart';
import 'package:responsive/app/ui/themes/my_cupertino_iconbutton_data.dart';
import 'package:responsive/app/ui/themes/my_cupertino_navigation_bar_data.dart';
import 'package:responsive/app/ui/themes/my_cupertino_page_scaffold_data.dart';
import 'package:responsive/app/ui/themes/my_material_app_bar_data.dart';
import 'package:responsive/app/ui/themes/my_material_iconbutton_data.dart';
import 'package:responsive/app/ui/themes/my_material_scaffold_data.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title, this.message = ""})
      : super(key: key);

  final String title;
  final String message;

  static const Key titleKey = Key('MyWidget.title');
  static const Key messageKey = Key('MyWidget.message');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
        body: Stack(
          children: <Widget>[
            Card(
              child: Center(
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
                    PlatformText(
                      '${injectedCount.state.count}',
                      key: const Key('text'),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      textScaleFactor: 1.0,
                      maxLines: 1,
                      semanticsLabel: 'counter value',
                    ),
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
                  PlatformIconButton(
                    key: const Key('increment'),
                    onPressed: () => injectedCount.setState(
                      (dynamic s) => s.increment(),
                    ),
                    //padding: EdgeInsets.zero,
                    icon: Icon(context.platformIcons.addCircledSolid),
                    material: (_, __) => myMaterialIconButtonData,
                    cupertino: (_, __) => myCupertinoIconButtonData,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
