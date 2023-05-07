import 'package:client/Model/feed.dart';

class FeedList {
  final List<Feed>? feed;

  FeedList({this.feed});

  factory FeedList.fromJson(List<dynamic> json) {
    List<Feed> feed = List.empty(growable: true);
    feed = json.map((i) => Feed.fromJson(i)).toList();

    return FeedList(
      feed: feed,
    );
  }
}
