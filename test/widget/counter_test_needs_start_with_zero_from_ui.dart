import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_imc_calc_app/feature/counter/counter_view.dart';
import 'package:my_imc_calc_app/feature/counter/counter_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  Widget createTestWidget() {
    return ChangeNotifierProvider(
      create: (_) => CounterViewModel(),
      child: const MaterialApp(
        home: CounterView(title: 'Test Counter'),
      ),
    );
  }

  testWidgets('deve iniciar com valor 0 na UI', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
  });

  testWidgets('deve incrementar o contador ao clicar no botão', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
  });
}
