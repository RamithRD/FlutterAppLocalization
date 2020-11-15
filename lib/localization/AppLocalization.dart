import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {

  final Locale locale;

  AppLocalization(this.locale);

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  Map<String, String> _localizedValues;

  //loads the json strings from a json files according to the user selcted locale
  Future load() async {
    String jsonStringValues =
      await rootBundle.loadString('lib/lang/${locale.languageCode}.json');

    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);

    _localizedValues = mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  //used in screens to get translated text
  String getTranslatedText(String key){
    return _localizedValues[key];
  }

  static const LocalizationsDelegate<AppLocalization> delegate = _AppLocalizationDelegate();

}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {

  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'sv'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization appLocalization = AppLocalization(locale);
    await appLocalization.load();
    return appLocalization;
  }

  @override
  bool shouldReload(_AppLocalizationDelegate old) => false;

}