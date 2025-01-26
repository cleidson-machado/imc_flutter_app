import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/model/counter_model.dart';

class CounterViewModel with ChangeNotifier {
  final CounterModel _counterModel = CounterModel(counter: 0);

  int get counter => _counterModel.counter;

  void incrementCounter() {
    _counterModel.counter++;
    notifyListeners();
  }
}
