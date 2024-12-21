// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pages/components/button_index_container_component.dart';
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/calc');
              },
              child: const ButtonIndexContainerComponent(txtButtonTitle: 'imc calculator'),
            ),
          ),
          GestureDetector(
            onTap: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) =>
                       const MyDefaultHomePage(title: theAppTitle),
                 ),
               );
             },

            child: const ButtonIndexContainerComponent(txtButtonTitle: 'combos from Api'),
          ),
          GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/calc');
              },
              child: const ButtonIndexContainerComponent(txtButtonTitle: 'extra One'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/calc');
              },
              child: const ButtonIndexContainerComponent(txtButtonTitle: 'extra two'),
            ),
        ],
      ),
    );
  }
}