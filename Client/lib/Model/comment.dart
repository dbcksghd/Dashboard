class Comment {
  int? id;
  int? postId;
  String? writeTime;
  String? comment;

  Comment({this.id, this.postId, this.writeTime, this.comment});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      postId: json['postId'],
      writeTime: json['writeTime'],
      comment: json['comment'],
    );
  }
}
