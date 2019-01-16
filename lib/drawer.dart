import 'package:flutter/material.dart';

class DrawerCom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('drawer'),
          ),
          body: Center(
            child: Text('222'),
          ),
          drawer: Drawer(
            elevation: 2.0,
            semanticLabel: 'dsdsd',
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Text(
                    'head',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  decoration: BoxDecoration(color: Colors.blue),
                ),
                ListTile(
                  leading: Icon(Icons.save),
                  title: Text('目录1'),
                ),
                ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('目录2'),
                ),
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('目录3'),
                  onTap: () {
                    print('here');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
