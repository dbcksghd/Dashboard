import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:client/Model/sign_in_response.dart';

class SignInDataSource {
  final String signInUrl = 'http://localhost:8080/sign-in';

  Future<SignInResponse> signIn(String id, password) async {
    final response = await http.post(
      Uri.parse(signInUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'id': id, 'password': password}),
    );
    if (response.statusCode == 200) {
      return SignInResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("로그인 실패");
    }
  }
}
