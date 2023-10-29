import 'package:network_module/network_module.dart';

final class CreateFeedRequestDTO extends BaseRequestDTO {
  final String title, content;

  CreateFeedRequestDTO({required this.title, required this.content});

  @override
  Map<String, dynamic> toJson() => {'title': title, 'content': content};
}
