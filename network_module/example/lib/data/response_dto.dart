import 'package:network_module/network_module.dart';
import 'package:network_module_example/domain/entity.dart';

class Test extends BaseResponseDTO<TestEntity> {
  late int userId;
  late int id;
  late String title;
  late bool completed;

  Test();

  factory Test.fromJson(Map<String, dynamic> json) => Test()
    ..userId = json['userId']
    ..id = json['id']
    ..title = json['title']
    ..completed = json['completed'];

  @override
  Test fromJson(Map<String, dynamic> json) => Test.fromJson(json);

  @override
  TestEntity toEntity() {
    return TestEntity(title: title);
  }
}
