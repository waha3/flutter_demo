import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'model.dart';
import 'detail.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final List<Map<String, String>> tabs = [
    {'name': '全部', 'key': 'all'},
    {'name': '精华', 'key': 'good'},
    {'name': '分享', 'key': 'share'},
    {'name': '问答', 'key': 'ask'},
    {'name': '招聘', 'key': 'job'},
    {'name': '客户端测试', 'key': 'dev'}
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: <String, WidgetBuilder>{'/detail': (context) => Detail()},
      title: 'demo',
      theme: ThemeData(primaryColor: Colors.green),
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('flutter'),
            bottom: TabBar(
              isScrollable: true,
              tabs: tabs.map((Map tab) {
                return Tab(child: Text(tab['name']));
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: tabs.map((Map tab) {
              return ListCom(currentTab: tab['key']);
            }).toList(),
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                DrawerHeader(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListCom extends StatefulWidget {
  final currentTab;
  ListCom({this.currentTab});
  @override
  ListComState createState() {
    return ListComState();
  }
}

class ListComState extends State<ListCom> {
  num page = 0;
  num limit = 20;
  String currentTab = '';
  List data = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchList();
  }

  void fetchList() async {
    var http = new HttpClient();
    var uri = new Uri.https('cnodejs.org', '/api/v1/topics', {
      'limit': limit.toString(),
      'page': page.toString(),
      'tab': widget.currentTab
    });
    var request = await http.getUrl(uri);
    var response = await request.close();
    var body = await response.transform(utf8.decoder).join();
    Map json = jsonDecode(body);
    Topics topics = Topics.fromJson(json);
    setState(() {
      data.addAll(topics.data);
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Container(
            alignment: Alignment(0, 0),
            child: SizedBox(
                child: CircularProgressIndicator(), width: 20.0, height: 20.0),
          )
        : ListView.separated(
            itemCount: data.length,
            itemBuilder: (context, i) {
              if (i == data.length - 1 && !(data.isEmpty)) {
                page += 1;
                fetchList();
                return Container(
                  padding: EdgeInsets.all(2),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (!(data.isEmpty)) {
                var url = data[i].author['avatar_url'] as String;
                var id = data[i].id as String;
                var title = data[i].title as String;
                return ListTile(
                    leading: CircleAvatar(
                      child: Image.network(
                        url.startsWith('https') ? url : 'https:' + url,
                      ),
                    ),
                    title: Text(data[i].title),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Detail(id: id, topicTitle: title);
                      }));
                    });
              }
            },
            separatorBuilder: (context, i) => Divider(),
          );
  }
}
