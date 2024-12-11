// ignore_for_file: use_key_in_widget_constructors, avoid_print, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_imc_calc_app/pages/components/default_card_container_component.dart';
import 'package:my_imc_calc_app/pages/components/default_column_icon_component.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';

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
  String onOffTextMsnMale = kOffStatusLabel;
  String onOffTextMsnFemale = kOffStatusLabel;
  Gender selectedGender = Gender.none;
  int peopleBodyHeight = 180;

  //### Business Logic Using Traditional Way of coding #############################
  void maleCardLabelUpdate(String txtLabel) {
    if (txtLabel == kOffStatusLabel) {
      onOffTextMsnMale = kOnStatusLabel;
      onOffTextMsnFemale = kOffStatusLabel;
    }
  }

  void femaleCardLabelUpdate(String txtLabel) {
    if (txtLabel == kOffStatusLabel) {
      onOffTextMsnFemale = kOnStatusLabel;
      onOffTextMsnMale = kOffStatusLabel;
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        cardColor: selectedGender == Gender.male
                            ? kColorForActiveDefaultContainerCard
                            : kColorForInactiveDefaultContainerCard,
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
                        cardColor: selectedGender == Gender.female
                            ? kColorForActiveDefaultContainerCard
                            : kColorForInactiveDefaultContainerCard,
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
            Expanded(
              child: DefaultCardContainerComponent(
                cardColor: kColorForActiveDefaultContainerCard,
                cardChildContent: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '( ALTURA )',
                      style: kTxtGenderTitleStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          peopleBodyHeight.toString(),
                          style: kBigNumberTextStyle,
                        ),
                        const Text(
                          ' cm',
                          style: kMetricTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      activeColor: Colors.lightGreenAccent,
                      inactiveColor: Colors.black12,
                      onChanged: (double sliderDynamicValue) {
                        setState(() {
                            peopleBodyHeight = sliderDynamicValue.round();
                        });
                      },
                      value: peopleBodyHeight.toDouble(),
                      min: 120.0,
                      max: 220.0,
                    )
                  ],
                ),
              ),
            ),
            const Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: DefaultCardContainerComponent(
                      cardColor: kColorForActiveDefaultContainerCard,
                      cardChildContent: Column(
                        children: [
                          Text('Content ToDo...'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: DefaultCardContainerComponent(
                      cardColor: kColorForActiveDefaultContainerCard,
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
                height: kHeightBottomPageContainer),
          ],
        ));
  }
}
