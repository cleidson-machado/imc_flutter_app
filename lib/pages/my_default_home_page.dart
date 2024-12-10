// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_imc_calc_app/pages/components/default_card_container_component.dart';
import 'package:my_imc_calc_app/pages/components/default_column_icon_component.dart';

//### Constants-Variables
const heightBottomPageContainer = 90.0;
const colorForActiveDefaultContainerCard = Color(0xFF9E9E9E);
const colorForInactiveDefaultContainerCard = Color(0xFF383838);

class MyDefaultHomePage extends StatefulWidget {
  const MyDefaultHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyDefaultHomePage> createState() => _MyDefaultHomePageState();
}

class _MyDefaultHomePageState extends State<MyDefaultHomePage> {
  Color maleCardColor = colorForInactiveDefaultContainerCard;
  Color femaleCardColor = colorForInactiveDefaultContainerCard;

  //### Business Logic Using Traditional Way of coding #############################
  void updateCardColorbyGenderChice(int gender) {

    if (gender == 1) {
      //print('Passei aqui; $gender');
      if (maleCardColor == colorForInactiveDefaultContainerCard) {
        maleCardColor = colorForActiveDefaultContainerCard;
        femaleCardColor = colorForInactiveDefaultContainerCard;
      } else {
        maleCardColor = colorForInactiveDefaultContainerCard;
      }
    }

    if (gender == 2) {
      //print('Passei aqui; $gender');
      if (femaleCardColor == colorForInactiveDefaultContainerCard) {
        femaleCardColor = colorForActiveDefaultContainerCard;
        maleCardColor = colorForInactiveDefaultContainerCard;
      } else {
        femaleCardColor = colorForInactiveDefaultContainerCard;
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
                          updateCardColorbyGenderChice(1);
                        });
                      },
                      child: DefaultCardContainerComponent(
                        cardColor: maleCardColor,
                        cardChildContent: const DefaultColumnIconComponent(
                          txtGenderTitle: 'MASCULINO',
                          iconTypeInfo: FontAwesomeIcons.mars,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateCardColorbyGenderChice(2);
                        });
                      },
                      child: DefaultCardContainerComponent(
                        cardColor: femaleCardColor,
                        cardChildContent: const DefaultColumnIconComponent(
                          txtGenderTitle: 'FEMININO',
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
