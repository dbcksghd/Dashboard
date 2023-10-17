import 'package:network_module/network_module.dart';

class SignInRequestDTO extends BaseRequestDTO {
  late String id;
  late String password;

  SignInRequestDTO();

  @override
  Map<String, dynamic> toJson() => {'id': id, 'password': password};
}
