// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pages/components/default_card_container_component.dart';
import 'package:my_imc_calc_app/pages/components/default_custom_container_button_component.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';

class MyCalculatorPage extends StatefulWidget {
  const MyCalculatorPage({super.key, required this.title});
  final String title;

  @override
  State<MyCalculatorPage> createState() => _MyCalculatorPageState();
}

class _MyCalculatorPageState extends State<MyCalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2.5,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 22),
              child: const Text(
                'Resultado',
                textAlign: TextAlign.center,
                style: kBigNumberTextStyle,
              ),
            ),
          ),
          const Expanded(
            flex: 5,
            child: DefaultCardContainerComponent(
              cardColor: kColorForActiveDefaultContainerCard,
              cardChildContent: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'NORMAL',
                    style: kLabelResultTextStyle,
                  ),
                  Text(
                    '18.4',
                    style: kLabelForIMCNumberTextStyle,
                  ),
                  Text(
                    'O Seu IMC está baixo, você \n precisa alimentar-se mais!',
                    textAlign: TextAlign.center,
                    style: kLabelForAdviceMsnTextStyle,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const DefaultCustomContainerButtonComponent(txtButtonTitle: ' ( re-calcular )',),
            ),
        ],
      ),
    );
  }
}
