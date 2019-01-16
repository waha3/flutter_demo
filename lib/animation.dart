import 'package:flutter/material.dart';

class AnimationCom extends StatefulWidget {
  @override
  AnimationState createState() {
    return AnimationState();
  }
}

class AnimationState extends State<AnimationCom> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('动画'),
        ),
        body: Center(
          child: AnimatedOpacity(
            opacity: visible ? 0.0 : 1.0,
            duration: Duration(milliseconds: 1000),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              visible = !visible;
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
