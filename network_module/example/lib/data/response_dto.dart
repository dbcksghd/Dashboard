import 'package:network_module/network_module.dart';
import 'package:network_module_example/domain/entity.dart';

final class Test extends BaseResponseDTO<TestEntity> {
  late int id, age;
  late String name, lastName, email, password;

  Test();

  factory Test.fromJson(Map<String, dynamic> json) => Test()
    ..id = json['id']
    ..age = json['age']
    ..name = json['name']
    ..lastName = json['lastName']
    ..email = json['email']
    ..password = json['password'];

  @override
  Test fromJson(Map<String, dynamic> json) => Test.fromJson(json);

  @override
  TestEntity toEntity() => TestEntity(
        id: id,
        age: age,
        name: name,
        lastName: lastName,
        email: email,
        password: password,
      );
}

final class TestList extends BaseResponseDTO<List<TestEntity>> {
  late List<Test> testList;

  TestList();

  @override
  fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      testList = [];
      json['users'].forEach((data) {
        testList.add(Test.fromJson(data));
      });
    }
    return testList;
  }

  @override
  List<TestEntity> toEntity() => testList.map((e) => e.toEntity()).toList();
}
