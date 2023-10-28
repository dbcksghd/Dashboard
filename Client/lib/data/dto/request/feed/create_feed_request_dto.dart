import 'package:network_module/network_module.dart';

final class CreateFeedRequestDTO extends BaseRequestDTO {
  final String id;
  final String password;

  CreateFeedRequestDTO({required this.id, required this.password});

  @override
  Map<String, dynamic> toJson() => {'id': id, 'password': password};
}
