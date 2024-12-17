// ignore_for_file: avoid_unnecessary_containers, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/Model/user_mesure.dart';
import 'package:my_imc_calc_app/pages/components/default_card_container_component.dart';
import 'package:my_imc_calc_app/pages/components/default_custom_container_button_component.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';
import 'package:my_imc_calc_app/pages/my_cauculator_list_page.dart';

class MyCalculatorPage extends StatelessWidget {

  const MyCalculatorPage(
      {super.key,
      required this.title,

      this.pageBodyHeight,
      this.pageBodyWeight,
      this.pageBodyAge,
      this.pageGender,

      this.pageTxtImcCalc,
      this.pagetTxtLabel,
      this.pagetTxtInterpretation

      });
  
  final String title;

  final int? pageBodyHeight;
  final int? pageBodyWeight;
  final int? pageBodyAge;
  final String? pageGender;

  final String? pageTxtImcCalc;
  final String? pagetTxtLabel;
  final String? pagetTxtInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2.5,
        title: Text(title),
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
          //###### BASIC FOR UNDESTAND THE LIS CRIATION ##################################
          
          GestureDetector(
            onTap: () {

              UserMesure userData = UserMesure(
                bodyHeight: pageBodyHeight!,
                bodyWeight: pageBodyWeight!,
                bodyAge: pageBodyAge,
                bodyGender: pageGender,

                imcCalc: pageTxtImcCalc,
                txtLabel: pagetTxtLabel,
                txtInterpretation: pagetTxtInterpretation,

                );

                List<UserMesure> userDataList = [];

                userDataList.add(userData);

                print('DATA_SEND: $userDataList');

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyCalculatorListPage(title: title),
                ),
              );

            },
            child: Container(
              padding: const EdgeInsets.only(top: 5),
              child: const Text(
                '( Sate to a List )',
                textAlign: TextAlign.center,
                style: kTxtBtnTextStyle,
              ),
            ),
          ),

          //###### BASIC FOR UNDESTAND THE LIS CRIATION ##################################
          Expanded(
            flex: 5,
            child: DefaultCardContainerComponent(
              cardColor: kColorForActiveDefaultContainerCard,
              cardChildContent: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    pagetTxtLabel!,
                    style: kLabelResultTextStyle,
                  ),
                  Text(
                    pageTxtImcCalc!,
                    style: kLabelForIMCNumberTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Text(
                      pagetTxtInterpretation!,
                      textAlign: TextAlign.center,
                      style: kLabelForAdviceMsnTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const DefaultCustomContainerButtonComponent(
              txtButtonTitle: ' ( re-calcular )',
            ),
          ),
        ],
      ),
    );
  }
}
