import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_imc_calc_app/feature/counter/counter_view.dart';

import '../mocks/mock_counter_view_model.dart';

void main() {
  testWidgets('deve renderizar o contador com valor falso vindo do mock',
      (WidgetTester tester) async {
    final mockViewModel = MockCounterViewModel();
    when(mockViewModel.counter).thenReturn(222);
    when(mockViewModel.addListener(any)).thenAnswer((_) {});
    when(mockViewModel.removeListener(any)).thenAnswer((_) {});

    await tester.pumpWidget(
      MaterialApp(
        home: CounterView(
          title: 'Mock Test',
          viewModel: mockViewModel, // ← Passa o mock diretamente
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('222'), findsOneWidget);
    verify(mockViewModel.counter).called(greaterThan(0));
  });
}