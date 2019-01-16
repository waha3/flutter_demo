import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'model.dart';
//import 'package:html/parser.dart' show parse;
//import 'package:html/dom.dart';

class Detail extends StatefulWidget {
  final id;
  final topicTitle;

  Detail({Key key, this.id, this.topicTitle}) : super(key: key);

  @override
  DetailState createState() => new DetailState();
}

class DetailState extends State<Detail> {
  String content;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchTopic();
  }

  void fetchTopic() async {
    var http = new HttpClient();
    var uri = new Uri.https('cnodejs.org', '/api/v1/topic/${widget.id}');
    var request = await http.getUrl(uri);
    var response = await request.close();
    var body = await response.transform(utf8.decoder).join();
    Map json = jsonDecode(body);
    Topic topic = Topic.fromJson(json['data']);
    setState(() {
      content = topic.content;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(widget.topicTitle),
      ),
      body: loading
          ? Container(
              alignment: Alignment(-1, -1),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 1.5,
                child: LinearProgressIndicator(),
              ),
            )
          : Text(content),
    );
  }
}
