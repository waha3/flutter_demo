import 'package:flutter/material.dart';

class TabsCom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('tabs'),
            bottom: TabBar(tabs: [
              Tab(
                child: Text('one'),
              ),
              Tab(
                child: Text('two'),
              ),
              Tab(
                child: Text('three'),
              )
            ]),
          ),
          body: TabBarView(children: [
            Icon(Icons.edit),
            Icon(Icons.save),
            Icon(Icons.list),
          ]),
        ),
      ),
    );
  }
}
