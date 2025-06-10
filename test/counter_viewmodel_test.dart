import 'package:flutter_test/flutter_test.dart';
import 'package:my_imc_calc_app/feature/counter/counter_view_model.dart';

void main() {
  group('CounterViewModel', () {

    test('deve iniciar com valor 0', () {
      final viewModel = CounterViewModel();

      expect(viewModel.counter, 0);
    });

    test('deve incrementar o contador corretamente', () {
      final viewModel = CounterViewModel();

      viewModel.incrementCounter();

      expect(viewModel.counter, 1);
    });

    test('deve notificar listeners ao incrementar', () {
      final viewModel = CounterViewModel();
      bool notified = false;

      viewModel.addListener(() {
        notified = true;
      });

      viewModel.incrementCounter();

      expect(notified, true);
    });
  });
}
