import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterapptranslations/localization/AppLocalization.dart';
import 'package:flutterapptranslations/localization/localization_constant.dart';
import 'package:flutterapptranslations/routes/CustomRouter.dart';
import 'package:flutterapptranslations/routes/routings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  static void setLocale(BuildContext context, Locale locale){
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  void setLocale(Locale locale){
    setState(() {
      _locale = locale;
    });
  }
  
  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      locale: _locale,
      supportedLocales: [
        Locale('en', 'US'),
        Locale('sv', 'SE'),
      ],
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales){
        for(var locale in supportedLocales){
          if(locale.languageCode == deviceLocale.languageCode && locale.countryCode == deviceLocale.countryCode){
            return deviceLocale;
          }
        }
        return supportedLocales.first;
      },
      onGenerateRoute: CustomRouter.allRoutes,
        initialRoute: homeRoute,
    );
  }
}
