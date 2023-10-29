import 'package:network_module/network_module.dart';

final class CreateCommentRequestDTO extends BaseRequestDTO {
  final int feedId;
  final String writeTime, content;

  CreateCommentRequestDTO(
      {required this.feedId, required this.writeTime, required this.content});

  @override
  Map<String, dynamic> toJson() =>
      {'feedId': feedId, 'writeTime': writeTime, 'content': content};
}
