import 'package:client/core/network/interface/network.dart';
import 'package:client/core/network/source/network_impl.dart';
import 'package:client/data/data_source/feed/remote/remote_feed_data_source.dart';
import 'package:client/data/repository/feed/feed_repository_impl.dart';
import 'package:client/domain/repository/feed_repository.dart';
import 'package:client/domain/use_case/feed/get_all_feeds_use_case.dart';
import 'package:client/presentation/feed_page/feed_page_view_model.dart';
import 'package:network_module/network_module.dart';
import 'package:provider/provider.dart';

List<ChangeNotifierProvider> di() {
  HttpHelper httpHelper = HttpHelper();
  Networking networking = NetworkingImpl(httpHelper: httpHelper);
  RemoteFeedDataSource remoteFeedDataSource =
      RemoteFeedDataSource(networking: networking);
  FeedRepository feedRepository =
      FeedRepositoryImpl(remoteFeedDataSource: remoteFeedDataSource);
  GetAllFeedsUseCase getAllFeedsUseCase =
      GetAllFeedsUseCase(feedRepository: feedRepository);
  return [
    ChangeNotifierProvider<FeedPageViewModel>(
        create: (context) =>
            FeedPageViewModel(getAllFeedsUseCase: getAllFeedsUseCase)),
  ];
}
