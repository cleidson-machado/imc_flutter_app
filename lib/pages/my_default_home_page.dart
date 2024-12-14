// ignore_for_file: use_key_in_widget_constructors, avoid_print, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_imc_calc_app/pages/components/default_card_container_component.dart';
import 'package:my_imc_calc_app/pages/components/default_column_icon_component.dart';
import 'package:my_imc_calc_app/pages/components/default_custom_rounded_button_component.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';
import 'package:my_imc_calc_app/pages/my_calculator_page.dart';

//### ADD Operador Ternário no Código em Substituição ao método clássico
//### Ternary Operator with multiple condition in flutter dart...
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
  int peopleBodyHeight = 175;
  int peopleBodyWeight = 60;
  int peopleBodyAge = 18;

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
                        //# Ternary Operator ########################
                        cardColor: selectedGender == Gender.male
                            ? kColorForActiveDefaultContainerCard
                            : kColorForInactiveDefaultContainerCard,
                        // END # Ternary Operator ########################
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
                        //# Ternary Operator ########################
                        cardColor: selectedGender == Gender.female
                            ? kColorForActiveDefaultContainerCard
                            : kColorForInactiveDefaultContainerCard,
                        // END # Ternary Operator ########################
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
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: DefaultCardContainerComponent(
                      cardColor: kColorForActiveDefaultContainerCard,
                      cardChildContent: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '( PESO )',
                            style: kTxtGenderTitleStyle,
                          ),
                          Text(
                            peopleBodyWeight.toString(),
                            style: kBigNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DefaultCustomRoundedButtonComponent(
                                theIcon: FontAwesomeIcons.plus,
                                onAction: () {
                                  setState(() {
                                    peopleBodyWeight--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              DefaultCustomRoundedButtonComponent(
                                theIcon: FontAwesomeIcons.minus,
                                onAction: () {
                                  setState(() {
                                    peopleBodyWeight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: DefaultCardContainerComponent(
                      cardColor: kColorForActiveDefaultContainerCard,
                      cardChildContent: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '( IDADE )',
                            style: kTxtGenderTitleStyle,
                          ),
                          Text(
                            peopleBodyAge.toString(),
                            style: kBigNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DefaultCustomRoundedButtonComponent(
                                theIcon: FontAwesomeIcons.plus,
                                onAction: () {
                                  setState(() {
                                    peopleBodyAge--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              DefaultCustomRoundedButtonComponent(
                                theIcon: FontAwesomeIcons.minus,
                                onAction: () {
                                  setState(() {
                                    peopleBodyAge++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                //ADD SOME ACTION.. I stop Here 13-12-2024...
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyCalculatorPage(
                      title: widget.title,
                    ),
                  ),
                );
              },
              child: Container(
                color: Theme.of(context).colorScheme.inversePrimary,
                margin: const EdgeInsets.only(top: 10.0),
                height: kHeightBottomPageContainer,
                padding: const EdgeInsets.only(bottom: 25.0),
                child: const Center(
                  child: Text(
                    '> CALCULAR <',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
