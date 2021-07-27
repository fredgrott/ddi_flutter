// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:catcher/catcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:inherited_state/inherited_state.dart';
import 'package:intro_inherited_state/app/domain/models/count_model.dart';
import 'package:intro_inherited_state/app/domain/repositories/app_brightness_service.dart';
import 'package:intro_inherited_state/app/domain/repositories/app_config.dart';
import 'package:intro_inherited_state/app/domain/repositories/app_logger_service.dart';
import 'package:intro_inherited_state/app/shared/app_vars.dart';
import 'package:intro_inherited_state/app/ui/home/myhomepage.dart';
import 'package:intro_inherited_state/app/ui/themes/my_material_theme_data.dart';
import 'package:intro_inherited_state/app/ui/themes/my_materialbased_cupertinotheme_data.dart';
import 'package:intro_inherited_state/generated/l10n.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // wrapping via Inherited Widget by using Inherited State
    return InheritedState(
      // ignore: avoid_redundant_argument_values
      states: [
        // ignore: avoid_redundant_argument_values
        Inject<CountModel>(() => CountModel(count: 0)),
      ],
      // remember builders are just sub stateless constructs
      builder: (_) {
        final dynamic appConfig = SL.get<AppConfig>();
        final dynamic appBrightness =
            SL.get<AppBrightnessService>()!.getAppBrightness();
        final myLogger = SL.get<AppLoggerService>()!.getAppLogger();

        myLogger.info('initialized');

        return Theme(
          data: brightness == appBrightness
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
              // still need to grab apptitle as onGeneratedTitle
              localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                // ignore: prefer_const_literals_to_create_immutables
                DefaultMaterialLocalizations.delegate,
                DefaultWidgetsLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate,
                AppLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.delegate.supportedLocales,
              // and with home page message it will be
              // AppLocalizations.of(context).appHomePageMessage
              onGenerateTitle: (context) =>
                  AppLocalizations.of(context).appTitle,
              material: (_, __) {
                return MaterialAppData(
                  navigatorKey: Catcher.navigatorKey,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  themeMode: brightness == Brightness.light
                      ? ThemeMode.light
                      : ThemeMode.dark,
                  builder: (context, widget) => ResponsiveWrapper(
                    maxWidth: 1200,
                    minWidth: 480,
                    defaultScale: true,
                    breakpoints: const [
                      ResponsiveBreakpoint.resize(
                        480,
                        name: MOBILE,
                      ),
                      ResponsiveBreakpoint.autoScale(
                        800,
                        name: TABLET,
                      ),
                      ResponsiveBreakpoint.resize(
                        1000,
                        name: DESKTOP,
                      ),
                    ],
                    child: MyHomePage(
                      title: AppLocalizations.of(context).appTitle,
                    ),
                  ),
                );
              },
              cupertino: (_, __) => CupertinoAppData(
                navigatorKey: Catcher.navigatorKey,
                // flows the Material Theme lightTheme through all the Cupertino stuff
                theme: myMaterialBasedCupertinoThemeData,
                builder: (context, widget) => ResponsiveWrapper(
                  maxWidth: 1200,
                  minWidth: 480,
                  defaultScale: true,
                  breakpoints: const [
                    ResponsiveBreakpoint.resize(
                      480,
                      name: MOBILE,
                    ),
                    ResponsiveBreakpoint.autoScale(
                      800,
                      name: TABLET,
                    ),
                    ResponsiveBreakpoint.resize(
                      1000,
                      name: DESKTOP,
                    ),
                  ],
                  child: MyHomePage(
                    title: AppLocalizations.of(context).appTitle,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
