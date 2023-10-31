import 'package:client/core/jwt_store/interface/jwt_store.dart';
import 'package:client/core/jwt_store/source/jwt_store_impl.dart';
import 'package:client/core/network/interface/network.dart';
import 'package:client/core/network/source/interceptor/jwt/jwt_interceptor.dart';
import 'package:client/core/network/source/network_impl.dart';
import 'package:client/data/data_source/auth/local/auth_local_data_source.dart';
import 'package:client/data/data_source/auth/remote/auth_remote_data_source.dart';
import 'package:client/data/data_source/comment/remote/remote_comment_data_source.dart';
import 'package:client/data/data_source/feed/remote/remote_feed_data_source.dart';
import 'package:client/data/repository/auth/auth_repository_impl.dart';
import 'package:client/data/repository/comment/comment_repository_impl.dart';
import 'package:client/data/repository/feed/feed_repository_impl.dart';
import 'package:client/domain/repository/auth_repository.dart';
import 'package:client/domain/repository/comment_repository.dart';
import 'package:client/domain/repository/feed_repository.dart';
import 'package:client/domain/use_case/auth/sign_in_use_case.dart';
import 'package:client/domain/use_case/comment/create_comment_use_case.dart';
import 'package:client/domain/use_case/comment/get_all_comments_use_case.dart';
import 'package:client/domain/use_case/feed/create_feed_use_case.dart';
import 'package:client/domain/use_case/feed/delete_feed_use_case.dart';
import 'package:client/domain/use_case/feed/get_all_feeds_use_case.dart';
import 'package:client/domain/use_case/feed/update_feed_use_case.dart';
import 'package:client/presentation/content_page/content_page_view_model.dart';
import 'package:client/presentation/feed_page/feed_page_view_model.dart';
import 'package:client/presentation/sign_in_page/sign_in_view_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

List<ChangeNotifierProvider> di() {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  JwtStore jwtStore = JwtStoreImpl(storage: storage);
  Networking networking = NetworkingImpl()
    ..interceptor.add(JWTInterceptor(jwtStore: jwtStore));
  AuthLocalDataSource authLocalDataSource =
      AuthLocalDataSource(jwtStore: jwtStore);
  AuthRemoteDataSource authRemoteDataSource =
      AuthRemoteDataSource(networking: networking);
  RemoteFeedDataSource remoteFeedDataSource =
      RemoteFeedDataSource(networking: networking);
  RemoteCommentDataSource remoteCommentDataSource =
      RemoteCommentDataSource(networking: networking);

  FeedRepository feedRepository =
      FeedRepositoryImpl(remoteFeedDataSource: remoteFeedDataSource);
  CommentRepository commentRepository =
      CommentRepositoryImpl(remoteCommentDataSource: remoteCommentDataSource);
  AuthRepository authRepository = AuthRepositoryImpl(
      authLocalDataSource: authLocalDataSource,
      authRemoteDataSource: authRemoteDataSource);

  GetAllFeedsUseCase getAllFeedsUseCase =
      GetAllFeedsUseCase(feedRepository: feedRepository);
  CreateFeedUseCase createFeedUseCase =
      CreateFeedUseCase(feedRepository: feedRepository);
  UpdateFeedUseCase updateFeedUseCase =
      UpdateFeedUseCase(feedRepository: feedRepository);
  DeleteFeedUseCase deleteFeedUseCase =
      DeleteFeedUseCase(feedRepository: feedRepository);
  CreateCommentUseCase createCommentUseCase =
      CreateCommentUseCase(commentRepository: commentRepository);
  GetAllCommentsUseCase getAllCommentsUseCase =
      GetAllCommentsUseCase(commentRepository: commentRepository);

  SignInUseCase signInUseCase = SignInUseCase(authRepository: authRepository);

  return [
    ChangeNotifierProvider<FeedPageViewModel>(
        create: (context) => FeedPageViewModel(
            getAllFeedsUseCase: getAllFeedsUseCase,
            createFeedUseCase: createFeedUseCase,
            updateFeedUseCase: updateFeedUseCase,
            deleteFeedUseCase: deleteFeedUseCase)),
    ChangeNotifierProvider<ContentPageViewModel>(
      create: (context) => ContentPageViewModel(
          getAllCommentsUseCase: getAllCommentsUseCase,
          createCommentUseCase: createCommentUseCase),
    ),
    ChangeNotifierProvider<SignInViewModel>(
      create: (context) => SignInViewModel(signInUseCase: signInUseCase),
    ),
  ];
}
