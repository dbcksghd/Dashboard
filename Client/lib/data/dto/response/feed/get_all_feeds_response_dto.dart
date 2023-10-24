import 'package:client/domain/entity/feed/feed_entity.dart';
import 'package:network_module/network_module.dart';

final class GetAllFeedsResponseDTO extends BaseResponseDTO<FeedEntity> {
  late int id;
  late String title, content;

  GetAllFeedsResponseDTO();

  factory GetAllFeedsResponseDTO.fromJson(Map<String, dynamic> json) =>
      GetAllFeedsResponseDTO()
        ..id = json['id']
        ..title = json['title']
        ..content = json['content'];

  @override
  fromJson(Map<String, dynamic> json) => GetAllFeedsResponseDTO.fromJson(json);

  @override
  FeedEntity toEntity() =>
      FeedEntity(feedId: id, title: title, content: content);
}
