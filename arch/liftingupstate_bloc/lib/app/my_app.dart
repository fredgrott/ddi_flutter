// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:ui';

import 'package:catcher/catcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:liftingupstate_bloc/app/shared/app_vars.dart';
import 'package:liftingupstate_bloc/app/ui/home/my_homepage.dart';
import 'package:liftingupstate_bloc/app/ui/themes/my_material_theme_data.dart';
import 'package:liftingupstate_bloc/app/ui/themes/my_materialbased_cupertinotheme_data.dart';


class MyApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp(this.navigatorKey);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Brightness brightness = Brightness.light;

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
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          title: myAppTitle,
          material: (_, __) {
            return MaterialAppData(
              navigatorKey: navigatorKey,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: brightness == Brightness.light
                  ? ThemeMode.light
                  : ThemeMode.dark,
            );
          },
          cupertino: (_, __) => CupertinoAppData(
            navigatorKey: navigatorKey,
            // flows the Material Theme lightTheme through all the Cupertino stuff
            theme: myMaterialBasedCupertinoThemeData,
            
            
          ),
          home: MyHomePage(title: myAppTitle),
        ),
      ),
    );
  }
}
