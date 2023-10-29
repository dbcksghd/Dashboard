import 'package:network_module/network_module.dart';

final class CreateCommentInRequestDTO extends BaseRequestDTO {
  final int feedId;
  final String writeTime, content;

  CreateCommentInRequestDTO(
      {required this.feedId, required this.writeTime, required this.content});

  @override
  Map<String, dynamic> toJson() =>
      {'feedId': feedId, 'writeTime': writeTime, 'content': content};
}
