import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/feature/counter/counter_model.dart';

class CounterViewModel extends ChangeNotifier {
  final CounterModel _counterModel = CounterModel();

  int get counter => _counterModel.value;

  void incrementCounter() {
    _counterModel.value++;
    notifyListeners();
  }
}
