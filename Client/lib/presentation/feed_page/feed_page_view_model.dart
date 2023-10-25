import 'package:client/domain/entity/feed/feed_entity.dart';
import 'package:client/domain/use_case/feed/get_all_feeds_use_case.dart';
import 'package:flutter/material.dart';
import 'package:network_module/network_module.dart';

class FeedPageViewModel extends ChangeNotifier {
  List<FeedEntity> _feedList = List.empty(growable: true);
  final GetAllFeedsUseCase _getAllFeedsUseCase;

  List<FeedEntity> get feedList => _feedList;

  FeedPageViewModel({required GetAllFeedsUseCase getAllFeedsUseCase})
      : _getAllFeedsUseCase = getAllFeedsUseCase {
    getAllFeeds();
  }

  void getAllFeeds() async {
    final res = await _getAllFeedsUseCase.execute();
    switch (res) {
      case Success(value: final value):
        _feedList = value;
        notifyListeners();
      case Failure(exception: final e):
        print(e);
    }
  }
}
