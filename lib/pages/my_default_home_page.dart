// ignore_for_file: use_key_in_widget_constructors, avoid_print, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_imc_calc_app/pages/components/default_card_container_component.dart';
import 'package:my_imc_calc_app/pages/components/default_column_icon_component.dart';

//### Constants-Variables
const heightBottomPageContainer = 90.0;
const colorForActiveDefaultContainerCard = Color(0xFF9E9E9E);
const colorForInactiveDefaultContainerCard = Color(0xFF383838);
const String offStatusLabel = '( OFF )';
const String onStatusLabel = '( ON )';

//### ADD Operador Ternário no Código em Substituição ao método clássico
enum Gender {
  male,
  female,
  none,
}

class MyDefaultHomePage extends StatefulWidget {
  const MyDefaultHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyDefaultHomePage> createState() => _MyDefaultHomePageState();
}

class _MyDefaultHomePageState extends State<MyDefaultHomePage> {
  String onOffTextMsnMale = offStatusLabel;
  String onOffTextMsnFemale = offStatusLabel;
  Gender selectedGender = Gender.none;
  

  //### Business Logic Using Traditional Way of coding #############################
  void maleCardLabelUpdate(String txtLabel) {
    if(txtLabel == offStatusLabel){
        onOffTextMsnMale = onStatusLabel;
        onOffTextMsnFemale = offStatusLabel;
    }
  }

  void femaleCardLabelUpdate(String txtLabel) {
    if(txtLabel == offStatusLabel){
        onOffTextMsnFemale = onStatusLabel;
        onOffTextMsnMale = offStatusLabel;
    }
  }
  //### END - Business Logic Using Traditional Way of coding #########################

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          elevation: 2.5,
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                          maleCardLabelUpdate(onOffTextMsnMale);
                        });
                      },
                      child: DefaultCardContainerComponent(
                        cardColor: selectedGender == Gender.male ? colorForActiveDefaultContainerCard : colorForInactiveDefaultContainerCard,
                        cardChildContent: DefaultColumnIconComponent(
                          txtGenderTitle: 'MASCULINO',
                          txtInfoOnOff: onOffTextMsnMale,
                          iconTypeInfo: FontAwesomeIcons.mars,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                          femaleCardLabelUpdate(onOffTextMsnFemale);
                        });
                      },
                      child: DefaultCardContainerComponent(
                        cardColor: selectedGender == Gender.female ? colorForActiveDefaultContainerCard : colorForInactiveDefaultContainerCard,
                        cardChildContent: DefaultColumnIconComponent(
                          txtGenderTitle: 'FEMININO',
                          txtInfoOnOff: onOffTextMsnFemale,
                          iconTypeInfo: FontAwesomeIcons.venus,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: DefaultCardContainerComponent(
                cardColor: colorForActiveDefaultContainerCard,
                cardChildContent: Column(
                  children: [
                    Text('Content ToDo...'),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: DefaultCardContainerComponent(
                      cardColor: colorForActiveDefaultContainerCard,
                      cardChildContent: Column(
                        children: [
                          Text('Content ToDo...'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: DefaultCardContainerComponent(
                      cardColor: colorForActiveDefaultContainerCard,
                      cardChildContent: Column(
                        children: [
                          Text('Content ToDo...'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                color: Theme.of(context).colorScheme.inversePrimary,
                margin: const EdgeInsets.only(top: 10.0),
                height: heightBottomPageContainer),
          ],
        ));
  }
}
