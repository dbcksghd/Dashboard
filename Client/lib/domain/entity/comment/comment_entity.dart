class CommentEntity {
  final int id, feedId;
  final String writeTime, content;

  CommentEntity({
    required this.id,
    required this.feedId,
    required this.writeTime,
    required this.content,
  });
}
