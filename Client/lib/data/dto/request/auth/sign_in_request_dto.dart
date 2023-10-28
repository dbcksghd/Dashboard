import 'package:network_module/network_module.dart';

final class SignInRequestDTO extends BaseRequestDTO {
  final String id;
  final String password;

  SignInRequestDTO({required this.id, required this.password});

  @override
  Map<String, dynamic> toJson() => {'id': id, 'password': password};
}
