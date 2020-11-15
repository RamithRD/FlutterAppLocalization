import 'package:flutter/cupertino.dart';
import 'package:flutterapptranslations/localization/AppLocalization.dart';
import 'package:shared_preferences/shared_preferences.dart';

String translate(BuildContext context, String key)
  => AppLocalization.of(context).getTranslatedText(key);

//supported lang codes
const String ENGLISH = 'en';
const String SWEDISH = 'sv';

const String LANGUAGE_CODE = 'LanguageCode';

Future<Locale> setLocale(String langCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  await _prefs.setString(LANGUAGE_CODE, langCode);

  return _locale(langCode);

}

Locale _locale(String langCode) {
  Locale _temp;

  switch(langCode){
    case ENGLISH:
      _temp = Locale(ENGLISH, 'US');
      break;
    case SWEDISH:
      _temp = Locale(SWEDISH, 'SE');
      break;
    default:
      _temp = Locale(ENGLISH, 'US');
  }

  return _temp;
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String langCode = _prefs.getString(LANGUAGE_CODE) ?? ENGLISH;
  return _locale(langCode);
}
