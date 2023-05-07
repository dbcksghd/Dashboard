import 'package:client/DataSource/feed_data_source.dart';
import 'package:client/Model/feed.dart';

class FeedRepository {
  final FeedDataSource _dataSource = FeedDataSource();

  Future<void> createFeed(String title, content) async =>
      _dataSource.createFeed(title, content);

  Future<List<Feed>> readFeed() async => _dataSource.readFeed();

  Future<void> updateFeed(int id, String title, content) async =>
      _dataSource.updateFeed(id, title, content);

  Future<void> deleteFeed(int id) async => _dataSource.deleteFeed(id);
}
