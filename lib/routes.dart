import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/i18n.dart';

import 'services/settings.dart';
import 'views/home/homePage.dart';
import 'views/settings/settingsPage.dart';
import 'views/settings/languagePage.dart';

class Routes {
  final Settings settings = Settings();

  var routes = <String, WidgetBuilder>{
    '/Settings': (BuildContext context) => new SettingsPage(),
    '/Settings/Language': (BuildContext context) => new LanguagePage(),
  };

  Routes() {
    runApp(MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback: S.delegate.resolution(fallback: Locale('en', '')),
      title: 'Chameleon Mini App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
      routes: routes,
      locale: settings.locale,
    ));
  }
}