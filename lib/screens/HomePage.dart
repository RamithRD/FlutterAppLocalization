import 'package:flutter/material.dart';
import 'package:flutterapptranslations/localization/AppLocalization.dart';
import 'package:flutterapptranslations/localization/localization_constant.dart';
import 'package:flutterapptranslations/main.dart';
import 'package:flutterapptranslations/routes/routings.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void changeLanguage(String lang) async {

    Locale _temp = await setLocale(lang);

    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate(context, 'home_page')),
      ),
      body: Container(
        child: Column(
          children: [
            MaterialButton(
              color: Colors.blue,
              child: Text('Navigate To About Page'),
              onPressed: (){
                Navigator.pushNamed(context, aboutRoute);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('ENGLISH'),
              onPressed: () async {
                changeLanguage(ENGLISH);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('SWEDISH'),
              onPressed: () async {
                changeLanguage(SWEDISH);
              },
            ),
          ],
        ),
      ),
    );
  }
}
