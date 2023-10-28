import 'package:network_module/network_module.dart';

final class UpdateFeedRequestDTO extends BaseRequestDTO {
  final int id;
  final String title, content;

  UpdateFeedRequestDTO(
      {required this.id, required this.title, required this.content});

  @override
  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'content': content};
}
