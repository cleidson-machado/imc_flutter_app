// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_imc_calc_app/pages/components/default_card_container_component.dart';
import 'package:my_imc_calc_app/pages/components/default_column_icon_component.dart';

//### Constants-Variables
const heightBottomPageContainer = 90.0;
const colorForActiveDefaultContainerCard = Color(0xFF9E9E9E);
const colorForInactiveDefaultContainerCard = Color(0xFF383838);
const String defaultOnOffTxtStatus = '( OFF )';

enum Gender {
  male,
  female,
}

class MyDefaultHomePage extends StatefulWidget {
  const MyDefaultHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyDefaultHomePage> createState() => _MyDefaultHomePageState();
}

class _MyDefaultHomePageState extends State<MyDefaultHomePage> {
  Color maleCardColor = colorForInactiveDefaultContainerCard;
  String onOffTextMsnMale = defaultOnOffTxtStatus;

  Color femaleCardColor = colorForInactiveDefaultContainerCard;
  String onOffTextMsnMaleFemale = defaultOnOffTxtStatus;
  

  //### Business Logic Using Traditional Way of coding #############################
  void updateCardColorbyGenderChice(Gender genderSelected) {

    if (genderSelected == Gender.male) {
      //print('Passei aqui; $gender');
      if (maleCardColor == colorForInactiveDefaultContainerCard) {
        maleCardColor = colorForActiveDefaultContainerCard;
        onOffTextMsnMale = '( ON )';
        onOffTextMsnMaleFemale = defaultOnOffTxtStatus;
        femaleCardColor = colorForInactiveDefaultContainerCard;
      } else {
        maleCardColor = colorForInactiveDefaultContainerCard;
        onOffTextMsnMale = defaultOnOffTxtStatus;
      }
    }

    if (genderSelected == Gender.female) {
      //print('Passei aqui; $gender');
      if (femaleCardColor == colorForInactiveDefaultContainerCard) {
        femaleCardColor = colorForActiveDefaultContainerCard;
        onOffTextMsnMaleFemale = '( ON )';
        onOffTextMsnMale = defaultOnOffTxtStatus;
        maleCardColor = colorForInactiveDefaultContainerCard;
      } else {
        femaleCardColor = colorForInactiveDefaultContainerCard;
        onOffTextMsnMaleFemale = defaultOnOffTxtStatus;
      }
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
                          updateCardColorbyGenderChice(Gender.male);
                        });
                      },
                      child: DefaultCardContainerComponent(
                        cardColor: maleCardColor,
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
                          updateCardColorbyGenderChice(Gender.female);
                        });
                      },
                      child: DefaultCardContainerComponent(
                        cardColor: femaleCardColor,
                        cardChildContent: DefaultColumnIconComponent(
                          txtGenderTitle: 'FEMININO',
                          txtInfoOnOff: onOffTextMsnMaleFemale,
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
