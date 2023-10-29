import 'package:client/domain/entity/comment/comment_entity.dart';
import 'package:network_module/network_module.dart';

final class GetAllCommentsResponseDTO extends BaseResponseDTO<CommentEntity> {
  late int id, feedId;
  late String writeTime, content;

  GetAllCommentsResponseDTO();

  factory GetAllCommentsResponseDTO.fromJson(Map<String, dynamic> json) =>
      GetAllCommentsResponseDTO()
        ..id = json['id']
        ..feedId = json['feedId']
        ..writeTime = json['writeTime']
        ..content = json['content'];

  @override
  fromJson(Map<String, dynamic> json) =>
      GetAllCommentsResponseDTO.fromJson(json);

  @override
  CommentEntity toEntity() => CommentEntity(
      id: id, feedId: feedId, writeTime: writeTime, content: content);
}
