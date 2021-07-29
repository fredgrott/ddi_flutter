// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:inherited_model_example/app/domain/binders/scopedmodel.dart';
import 'package:inherited_model_example/app/domain/entities/abstractmodel.dart';
import 'package:inherited_model_example/app/ui/themes/my_color_schemes.dart';
import 'package:inherited_model_example/app/ui/themes/my_cupertino_iconbutton_data.dart';
import 'package:inherited_model_example/app/ui/themes/my_cupertino_navigation_bar_data.dart';
import 'package:inherited_model_example/app/ui/themes/my_cupertino_page_scaffold_data.dart';
import 'package:inherited_model_example/app/ui/themes/my_material_app_bar_data.dart';
import 'package:inherited_model_example/app/ui/themes/my_material_iconbutton_data.dart';
import 'package:inherited_model_example/app/ui/themes/my_material_scaffold_data.dart';
import 'package:inherited_model_example/generated/l10n.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final String message;


  static const Key titleKey = Key('MyWidget.title');
  static const Key messageKey = Key('MyWidget.message');


  const MyHomePage(this.title, this.message);

  

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: myColorSchemes.primary,
        systemNavigationBarColor: myColorSchemes.primaryVariant,
        systemNavigationBarDividerColor:myColorSchemes.secondary,
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
        body: Stack(children: <Widget>[
          Card(
              child: Center(
                // ignore: prefer-trailing-comma
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    PlatformText(
                      AppLocalizations.of(context).counterButtonText,
                      key: const Key('text'),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      textScaleFactor: 1.0,
                      maxLines: 2,
                      semanticsLabel: 'increment the counter',
                    ),
                    ScopedModelDescendant<AbstractModel>(
                      builder: (context, child, model) => PlatformText(
                        model.counter.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
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
                  ScopedModelDescendant<AbstractModel>(
                    builder: (context, child, model) => PlatformIconButton(
                             onPressed: model.increment,
                             key: const Key('increment'),
                             icon: Icon(context.platformIcons.addCircledSolid),
                             material: (_, __) => myMaterialIconButtonData,
                             cupertino: (_, __) => myCupertinoIconButtonData,
                             
                  ),),
                ],
              ),
            ),
        ],),
      ),
    );
  }
}
