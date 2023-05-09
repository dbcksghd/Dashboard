import 'package:client/DataSource/sign_in_data_source.dart';
import 'package:client/Model/sign_in_response.dart';

class SignInRepository {
  final SignInDataSource _dataSource = SignInDataSource();

  Future<SignInResponse> signIn(String id, password, name) async =>
      await _dataSource.signIn(id, password, name);
}
