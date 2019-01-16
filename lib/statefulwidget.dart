import 'package:flutter/material.dart';
import 'detail.dart';

class StatefulCom extends StatefulWidget {
  @override
  StatefulComState createState() {
    print('createstate');
    return new StatefulComState(100);
  }
}

class StatefulComState extends State {
   num count;

  StatefulComState(this.count);

  @override
  void initState() {
    super.initState();
    print('initState');
    print(mounted.toString());
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    print(mounted.toString());
    return MaterialApp(
        routes: <String, WidgetBuilder>{
          '/detail': (BuildContext context) => new Detail(),
        },
        home: Builder(
          builder: (context) {
            return Container(
                color: Colors.orangeAccent,
                alignment: Alignment.center,
                child: Center(
                  child: FlatButton(
                    color: Colors.blue,
                    onPressed: () {
                      print('setState');
                      // setState(() {
                      //   count += 1;
                      // });

                      Navigator.of(context).pushNamed('/detail');

                      // Navigator.push(context,
                      //     new MaterialPageRoute(builder: (context) {
                      //   return new Detail();
                      // }));
                    },
                    child: Text(
                      count.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ));
          },
        ));
  }

  @override
  void didUpdateWidget(StatefulCom oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }
}