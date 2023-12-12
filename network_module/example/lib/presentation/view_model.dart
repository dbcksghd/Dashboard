import 'package:flutter/material.dart';
import 'package:network_module/network_module.dart';
import 'package:network_module_example/domain/entity.dart';
import 'package:network_module_example/domain/use_case.dart';

class ViewModel extends ChangeNotifier {
  List<TestEntity> _listEntity = [];
  final UseCase _useCase;

  List<TestEntity> get listEntity => _listEntity;

  ViewModel({required UseCase useCase}) : _useCase = useCase {
    changeEntity();
  }

  void changeEntity() async {
    final response = await _useCase.execute();
    switch (response) {
      case Success(value: final value):
        _listEntity = value;
      case Failure(exception: final e):
        print(e);
    }
    notifyListeners();
  }
}
