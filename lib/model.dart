class Topics {
  final bool success;
  final List<Topic> data;

  Topics({this.success, this.data});

  factory Topics.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Topic> topicList = list.map((i) => Topic.fromJson(i)).toList();
    return Topics(success: json['success'], data: topicList);
  }
}

class Topic {
  final String id;
  final String authorId;
  final String tab;
  final String content;
  final String title;
  final Map<String, String> author;

  Topic({
    this.id,
    this.authorId,
    this.tab,
    this.content,
    this.title,
    this.author,
  });

  factory Topic.fromJson(Map<String, dynamic> data) {
    return Topic(
      id: data['id'],
      authorId: data['id'],
      tab: data['tab'],
      content: data['content'],
      title: data['title'],
      author: Map.castFrom(data['author']),
    );
  }
}
