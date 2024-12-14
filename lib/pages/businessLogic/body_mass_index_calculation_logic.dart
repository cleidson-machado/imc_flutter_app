import 'dart:math';

class BodyMassIndexCalculationLogic {
  BodyMassIndexCalculationLogic(
      {required this.bodyHeight, required this.bodyWeight});

  final int bodyHeight;
  final int bodyWeight;
  late double _imc;

  String getImcCalculation() {
    _imc = bodyWeight / pow(bodyHeight / 100, 2);
    return _imc.toStringAsFixed(2);
  }

  String getTheResult() {
    if (_imc >= 25) {
      return 'Acima do Peso!';
    } else if (_imc > 18.5) {
      return 'Normal';
    } else {
      return 'Abaixo do Peso';
    }
  }

  String getTheResultByTextInterpretation () {
    if (_imc >= 25) {
      return 'Você está com o PESO corporal ACIMA DO NORMAL. Tente se exercitar mais!';
    } else if (_imc > 18.5) {
      return 'Excelente! O seu PESO corporal ESTÁ NORMAL';
    } else {
      return 'Você está com o PESO corporal ABAIXO DO NORMAL. Tente alimentar se mais e melhor!';
    }
  }


}
