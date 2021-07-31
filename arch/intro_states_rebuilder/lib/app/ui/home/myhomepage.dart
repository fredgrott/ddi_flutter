// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:intro_states_rebuilder/app/domain/bizlogic_controllers/counterstore.dart';
import 'package:intro_states_rebuilder/app/domain/repositories/counterx.dart';
import 'package:intro_states_rebuilder/app/ui/themes/my_color_schemes.dart';
import 'package:intro_states_rebuilder/app/ui/themes/my_cupertino_iconbutton_data.dart';
import 'package:intro_states_rebuilder/app/ui/themes/my_cupertino_navigation_bar_data.dart';
import 'package:intro_states_rebuilder/app/ui/themes/my_cupertino_page_scaffold_data.dart';
import 'package:intro_states_rebuilder/app/ui/themes/my_material_app_bar_data.dart';
import 'package:intro_states_rebuilder/app/ui/themes/my_material_iconbutton_data.dart';
import 'package:intro_states_rebuilder/app/ui/themes/my_material_scaffold_data.dart';
import 'package:intro_states_rebuilder/generated/l10n.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title, this.message = ""})
      : super(key: key);

  final String title;
  final String message;

  static const Key titleKey = Key('MyWidget.title');
  static const Key messageKey = Key('MyWidget.message');

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: myColorSchemes.primary,
        systemNavigationBarColor: myColorSchemes.onSecondary,
        systemNavigationBarDividerColor: myColorSchemes.secondaryVariant,
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
            AppLocalizations.of(context).appTitle,
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
        // this is not the only way to do a crossplatform fab
        body: Stack(children: <Widget>[
          Card(
            child: Center(
              // ignore: prefer-trailing-comma
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  PlatformText(
                    AppLocalizations.of(context).appHomepageMessage,
                    key: const Key('text'),
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                    textScaleFactor: 1.0,
                    maxLines: 2,
                    semanticsLabel: 'home message',
                  ),
                  On(
                    () => PlatformText(
                      '${counterStore.state}',
                      style: Theme.of(context).textTheme.headline5,
                      key: const Key('text'),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      textScaleFactor: 1.0,
                      maxLines: 1,
                      semanticsLabel: 'counter value',
                    ),
                  ).listenTo(counterStore),
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
                Builder(
                  builder: (context) => PlatformIconButton(
                    onPressed: () {
                      counterStore.setState(
                        (counterStore) => counterStore.increment,
                        //onSetState callback is invoked after counterRM emits a notification and before rebuild
                        //context to be used to shw snackBar

                        onSetState: On(() {
                          log('counterStore new state set');
                        }),
                        //onRebuildState is called after rebuilding the observer widget
                        onRebuildState: () {
                          log('counterStore state rebuilt');
                        },
                      );
                    },
                    key: const Key('increment'),
                    icon: Icon(context.platformIcons.addCircledSolid),
                    material: (_, __) => myMaterialIconButtonData,
                    cupertino: (_, __) => myCupertinoIconButtonData,
                  ),
                ),
                
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
