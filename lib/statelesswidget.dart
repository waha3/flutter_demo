import 'package:flutter/material.dart';

class StatelessCom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: new Text(
        context.toString(),
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
