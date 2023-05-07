class Feed {
  int? id;
  String? title;
  String? content;

  Feed({this.id, this.title, this.content});

  factory Feed.fromJson(Map<String, dynamic> json) {
    return Feed(
      id: json['id'],
      title: json['title'],
      content: json['content'],
    );
  }
}
