import 'package:flutter/material.dart';
import 'package:flutterapptranslations/routes/routings.dart';
import 'package:flutterapptranslations/screens/AboutPage.dart';
import 'package:flutterapptranslations/screens/HomePage.dart';
import 'package:flutterapptranslations/screens/NotFoundPage.dart';
import 'package:flutterapptranslations/screens/SettingsPage.dart';

class CustomRouter {

  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch(settings.name) {

      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => AboutPage());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => SettingsPage());

    }

    return MaterialPageRoute(builder: (_) => NotFoundPage());
  }

}