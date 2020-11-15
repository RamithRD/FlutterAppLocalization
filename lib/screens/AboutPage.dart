import 'package:flutter/material.dart';
import 'package:flutterapptranslations/routes/routings.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page'),
      ),
      body: Container(
        child: MaterialButton(
          color: Colors.blue,
          child: Text('Navigate To About Page'),
          onPressed: (){
            Navigator.pushNamed(context, settingsRoute);
          },
        ),
      ),
    );
  }
}
