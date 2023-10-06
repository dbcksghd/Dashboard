import 'package:flutter/material.dart';
import 'package:network_module_example/domain/entity.dart';
import 'package:network_module_example/domain/use_case.dart';

class ViewModel extends ChangeNotifier {
  TestEntity _entity = TestEntity(title: "");
  final UseCase _useCase;

  TestEntity get entity => _entity;

  ViewModel({required UseCase useCase}) : _useCase = useCase {
    changeEntity();
  }

  void changeEntity() async {
    final response = await _useCase.execute();
    _entity = response;
    notifyListeners();
  }
}
