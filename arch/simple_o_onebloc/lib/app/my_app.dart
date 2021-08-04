// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:ui';

import 'package:catcher/catcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:simple_o_onebloc/app/ui/home/my_homepage.dart';
import 'package:simple_o_onebloc/app/ui/themes/my_material_theme_data.dart';
import 'package:simple_o_onebloc/app/ui/themes/my_materialbased_cupertinotheme_data.dart';
import 'package:simple_o_onebloc/generated/l10n.dart';

class MyApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp(this.navigatorKey);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // we only need these two as responsive framework builder
  // handles other stuff
  final Brightness brightness =
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
          .platformBrightness;

  // we need this when finally  full highcontrast on android is in place
  final appHighContrast =
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).highContrast;

  @override
  Widget build(BuildContext context) {
    return Theme(
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
          // ignore: prefer_const_literals_to_create_immutables
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
            // ignore: prefer_const_literals_to_create_immutables
            AppLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.delegate.supportedLocales,
          builder: (_, __) => ResponsiveWrapper.builder(
            MyHomePage(
              title: AppLocalizations.of(context).appTitle,
            ),
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
          
        ),
      ),
    );
  }
}
