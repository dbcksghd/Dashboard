import 'package:client/data/dto/request/feed/create_feed_request_dto.dart';
import 'package:client/data/dto/request/feed/update_feed_request_dto.dart';
import 'package:client/domain/entity/feed/feed_entity.dart';
import 'package:client/domain/use_case/feed/create_feed_use_case.dart';
import 'package:client/domain/use_case/feed/delete_feed_use_case.dart';
import 'package:client/domain/use_case/feed/get_all_feeds_use_case.dart';
import 'package:client/domain/use_case/feed/update_feed_use_case.dart';
import 'package:flutter/material.dart';
import 'package:network_module/network_module.dart';

class FeedPageViewModel extends ChangeNotifier {
  List<FeedEntity> _feedList = List.empty(growable: true);
  final GetAllFeedsUseCase _getAllFeedsUseCase;
  final CreateFeedUseCase _createFeedUseCase;
  final UpdateFeedUseCase _updateFeedUseCase;
  final DeleteFeedUseCase _deleteFeedUseCase;

  List<FeedEntity> get feedList => _feedList;

  FeedPageViewModel(
      {required GetAllFeedsUseCase getAllFeedsUseCase,
      required CreateFeedUseCase createFeedUseCase,
      required UpdateFeedUseCase updateFeedUseCase,
      required DeleteFeedUseCase deleteFeedUseCase})
      : _getAllFeedsUseCase = getAllFeedsUseCase,
        _createFeedUseCase = createFeedUseCase,
        _updateFeedUseCase = updateFeedUseCase,
        _deleteFeedUseCase = deleteFeedUseCase {
    getAllFeeds();
  }

  Future<void> getAllFeeds() async {
    final res = await _getAllFeedsUseCase.execute();
    switch (res) {
      case Success(value: final value):
        _feedList = value;
        notifyListeners();
      case Failure(exception: final e):
        print(e);
    }
  }

  Future<void> createFeed(
      {required CreateFeedRequestDTO createFeedRequestDTO}) async {
    final res = await _createFeedUseCase.execute(
        createFeedRequestDTO: createFeedRequestDTO);
    switch (res) {
      case Success(value: final value):
        _feedList = value;
        notifyListeners();
      case Failure(exception: final e):
        print(e);
    }
  }

  Future<void> updateFeed(
      {required UpdateFeedRequestDTO updateFeedRequestDTO}) async {
    final res = await _updateFeedUseCase.execute(
        updateFeedRequestDTO: updateFeedRequestDTO);
    switch (res) {
      case Success(value: final value):
        _feedList = value;
        notifyListeners();
      case Failure(exception: final e):
        print(e);
    }
  }

  Future<void> deleteFeed({required int id}) async {
    final res = await _deleteFeedUseCase.execute(id: id);
    switch (res) {
      case Success(value: final value):
        _feedList = value;
        notifyListeners();
      case Failure(exception: final e):
        print(e);
    }
  }
}
