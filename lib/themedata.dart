import 'package:flutter/material.dart';

class ThemeDataCom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'theme data',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
        accentColor: Colors.red,
        fontFamily: 'Monaco',
        textTheme: TextTheme(
          headline: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
          title: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
          body1: TextStyle(
            fontSize: 10,
            fontFamily: 'hind',
          ),
        ),
      ),
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'theme data',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          body: Center(
            child: Container(
              color: Theme.of(context).accentColor,
              child: Text(
                'hello world',
                style: Theme.of(context).textTheme.headline,
              ),
            ),
          ),
        );
      }),
    );
  }
}
