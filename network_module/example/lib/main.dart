import 'package:flutter/material.dart';
import 'package:network_module_example/di/di.dart';
import 'package:network_module_example/presentation/view.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: di(), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestView(),
    );
  }
}

/*class Test extends BaseNetworkDTO {
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
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }
}*/
