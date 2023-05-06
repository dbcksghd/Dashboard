class Comment {
  int? id;
  String? writeTime;
  String? comment;

  Comment({this.id, this.writeTime, this.comment});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      writeTime: json['writeTime'],
      comment: json['comment'],
    );
  }
}
