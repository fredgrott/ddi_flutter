// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:ui';

import 'package:catcher/catcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:full_boilerplate/app/shared/app_vars.dart';
import 'package:full_boilerplate/app/shared/my_cupertino_color_scheme.dart';
import 'package:full_boilerplate/app/shared/my_cupertino_text_theme.dart';
import 'package:full_boilerplate/app/ui/home/my_homepage.dart';






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
              theme: ThemeData.from(colorScheme: const ColorScheme.light()),
              darkTheme: ThemeData.from(colorScheme: const ColorScheme.dark()),
              themeMode: brightness == Brightness.light
                  ? ThemeMode.light
                  : ThemeMode.dark,
            );
          },
          cupertino: (_, __) => CupertinoAppData(
            theme: CupertinoThemeData(
                brightness: brightness, // if null will use the system theme
                // ignore: prefer_const_constructors
                primaryColor: myCupertinoPrimaryColor,
                primaryContrastingColor: myCupertinoPrimaryContrastingColor,
                textTheme: myCupertinoTextThemeData,
                // ignore: prefer-trailing-comma
                barBackgroundColor: Colors.transparent),
          ),
          home: MyHomePage(title: myAppTitle),
                
        ),

      ),

      
    );

  }
}


