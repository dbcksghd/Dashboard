import 'package:client/data/dto/request/comment/create_comment_request_dto.dart';
import 'package:client/domain/entity/comment/comment_entity.dart';
import 'package:client/domain/use_case/comment/create_comment_use_case.dart';
import 'package:client/domain/use_case/comment/get_all_comments_use_case.dart';
import 'package:flutter/material.dart';
import 'package:network_module/network_module.dart';

class ContentPageViewModel extends ChangeNotifier {
  List<CommentEntity> _commentList = List.empty(growable: true);
  final GetAllCommentsUseCase _getAllCommentsUseCase;
  final CreateCommentUseCase _createCommentUseCase;

  List<CommentEntity> get commentList => _commentList;

  ContentPageViewModel(
      {required GetAllCommentsUseCase getAllCommentsUseCase,
      required CreateCommentUseCase createCommentUseCase})
      : _getAllCommentsUseCase = getAllCommentsUseCase,
        _createCommentUseCase = createCommentUseCase;

  Future<void> getAllComments({required int feedId}) async {
    final res = await _getAllCommentsUseCase.execute(feedId: feedId);
    switch (res) {
      case Success(value: final value):
        _commentList = value;
        notifyListeners();
      case Failure(exception: final e):
        print("댓글 불러오기 : $e");
    }
  }

  Future<void> createComment(
      {required CreateCommentInRequestDTO createCommentInRequestDTO}) async {
    final res = await _createCommentUseCase.execute(
        createCommentInRequestDTO: createCommentInRequestDTO);
    switch (res) {
      case Success(value: final value):
        _commentList = value;
        notifyListeners();
      case Failure(exception: final e):
        print("댓글 생성하기 : $e");
    }
  }
}
