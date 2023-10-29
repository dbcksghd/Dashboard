import 'package:client/core/jwt_store/interface/jwt_store.dart';
import 'package:client/core/jwt_store/source/jwt_store_impl.dart';
import 'package:client/core/network/interface/network.dart';
import 'package:client/core/network/source/interceptor/jwt/jwt_interceptor.dart';
import 'package:client/core/network/source/network_impl.dart';
import 'package:client/data/data_source/feed/remote/remote_feed_data_source.dart';
import 'package:client/data/repository/feed/feed_repository_impl.dart';
import 'package:client/domain/repository/feed_repository.dart';
import 'package:client/domain/use_case/feed/create_feed_use_case.dart';
import 'package:client/domain/use_case/feed/delete_feed_use_case.dart';
import 'package:client/domain/use_case/feed/get_all_feeds_use_case.dart';
import 'package:client/domain/use_case/feed/update_feed_use_case.dart';
import 'package:client/presentation/feed_page/feed_page_view_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

List<ChangeNotifierProvider> di() {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  JwtStore jwtStore = JwtStoreImpl(storage: storage);
  Networking networking = NetworkingImpl()
    ..interceptor.add(JWTInterceptor(jwtStore: jwtStore));
  RemoteFeedDataSource remoteFeedDataSource =
      RemoteFeedDataSource(networking: networking);
  FeedRepository feedRepository =
      FeedRepositoryImpl(remoteFeedDataSource: remoteFeedDataSource);
  GetAllFeedsUseCase getAllFeedsUseCase =
      GetAllFeedsUseCase(feedRepository: feedRepository);
  CreateFeedUseCase createFeedUseCase =
      CreateFeedUseCase(feedRepository: feedRepository);
  UpdateFeedUseCase updateFeedUseCase =
      UpdateFeedUseCase(feedRepository: feedRepository);
  DeleteFeedUseCase deleteFeedUseCase =
      DeleteFeedUseCase(feedRepository: feedRepository);
  return [
    ChangeNotifierProvider<FeedPageViewModel>(
        create: (context) => FeedPageViewModel(
            getAllFeedsUseCase: getAllFeedsUseCase,
            createFeedUseCase: createFeedUseCase,
            updateFeedUseCase: updateFeedUseCase,
            deleteFeedUseCase: deleteFeedUseCase)),
  ];
}
