import 'package:client/Model/feed.dart';
import 'package:client/Repository/feed_repository.dart';
import 'package:flutter/material.dart';

class FeedViewModel with ChangeNotifier {
  late final FeedRepository _repository;

  List<Feed> _feedList = List.empty(growable: true);

  List<Feed> get feedList => _feedList;

  FeedViewModel() {
    _repository = FeedRepository();
  }

  Future<void> createFeed(String title, content) async {
    await _repository.createFeed(title, content);
    readFeed();
  }

  Future<void> readFeed() async {
    _feedList = await _repository.readFeed();
    notifyListeners();
  }

  Future<void> updateFeed(int id, String title, content) async {
    await _repository.updateFeed(id, title, content);
    readFeed();
  }

  Future<void> deleteFeed(int id) async {
    await _repository.deleteFeed(id);
    readFeed();
  }
}
