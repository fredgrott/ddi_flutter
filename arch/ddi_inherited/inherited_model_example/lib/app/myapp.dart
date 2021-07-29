// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:ui';

import 'package:catcher/catcher.dart';
import 'package:catcher/core/catcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:inherited_model_example/app/domain/binders/scopedmodel.dart';
import 'package:inherited_model_example/app/domain/entities/abstractmodel.dart';
import 'package:inherited_model_example/app/ui/home/myhomepage.dart';

import 'package:inherited_model_example/app/ui/themes/my_material_theme_data.dart';
import 'package:inherited_model_example/app/ui/themes/my_materialbased_cupertinotheme_data.dart';
import 'package:inherited_model_example/generated/l10n.dart';
import 'package:responsive_framework/responsive_framework.dart';

// Still need stateful here as we have these services that are not routed through scoped model:
// brightness
// locale
class MyApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  final AbstractModel model;

  const MyApp(
    this.navigatorKey,
    this.model,
  );

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // normally we grab it as a future by using MediaQuery window to get the dark mode brightness property
  // locale can be grabbed the same way
  Brightness brightness = Brightness.light;


  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: widget.model, 
      child:Theme(
        data: brightness == Brightness.light
            ? ThemeData.from(colorScheme: const ColorScheme.light())
            : ThemeData.from(colorScheme: const ColorScheme.dark()),
        child: PlatformProvider(
          settings: PlatformSettingsData(
              // we need this as on CupertinoApps we use a Material parent container for
              // card and inkwell auto inserts material container at scaffold so we do not have to
              iosUsesMaterialWidgets: true,
            ),
          builder: (context) => PlatformApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: Catcher.navigatorKey,
            localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
              // ignore: prefer_const_literals_to_create_immutables
              DefaultMaterialLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
              AppLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.delegate.supportedLocales,
            builder: (_, __) => ResponsiveWrapper.builder(
              MyHomePage(AppLocalizations.of(context).appTitle, AppLocalizations.of(context).appHomepageMessage),
              maxWidth: 1200,
              minWidth: 480,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(450, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              ],
            ),
            onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
            material: (_, __) {
              return MaterialAppData(
                navigatorKey: Catcher.navigatorKey,
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: brightness == Brightness.light
                    ? ThemeMode.light
                    : ThemeMode.dark,
              );
            },
            cupertino: (_, __) => CupertinoAppData(
              navigatorKey: Catcher.navigatorKey,
              // flows the Material Theme lightTheme through all the Cupertino stuff
              theme: myMaterialBasedCupertinoThemeData,
            ),
          ),),
      ),);
  }
}
