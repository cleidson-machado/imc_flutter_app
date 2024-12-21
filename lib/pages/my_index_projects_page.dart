// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pages/components/default_custom_container_button_component.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';
import 'package:my_imc_calc_app/pages/my_default_home_page.dart';

const String theTitle = theAppTitle;

class MyIndexProjectsPage extends StatelessWidget {
  const MyIndexProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2.5,
        title: const Text('Index Project Choices'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyDefaultHomePage(title: theAppTitle),
                  ),
                );
              },
              child: const DefaultCustomContainerButtonComponent(
                txtButtonTitle: ' ( IMC-Calc-Project )',
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyDefaultHomePage(title: theAppTitle),
                  ),
                );
              },
              child: const DefaultCustomContainerButtonComponent(
                txtButtonTitle: ' ( COMBOS-Project )',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Navigator.of(context).pushNamed(RoutesLib.CARDS_LIST_VIEW_START);