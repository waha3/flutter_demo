import 'package:flutter/material.dart';

class SnackBarCom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Snackbar'),
        ),
        body: Builder(builder: (context) {
          return Center(
            child: FlatButton(
              color: Colors.green,
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text('here, this is a sneck'),
                  action: SnackBarAction(label: 'dd', onPressed: () {}),
                );

                Scaffold.of(context).showSnackBar(snackBar);
              },
              child: Text(
                'Boom',
                style: TextStyle(color: Colors.white, fontFamily: 'Coiny'),
              ),
            ),
          );
        }),
      ),
    );
  }
}
