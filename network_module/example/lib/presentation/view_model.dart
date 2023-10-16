import 'package:flutter/material.dart';
import 'package:network_module/network_module.dart';
import 'package:network_module_example/domain/entity.dart';
import 'package:network_module_example/domain/use_case.dart';

class ViewModel extends ChangeNotifier {
  TestEntity _entity = TestEntity(title: "");
  final UseCase _useCase;

  TestEntity get entityList => _entity;

  ViewModel({required UseCase useCase}) : _useCase = useCase {
    changeEntity();
  }

  void changeEntity() async {
    final response = await _useCase.execute();
    switch (response) {
      case Success(value: final value):
        _entity = value;
      default:
    }
    notifyListeners();
  }
}
