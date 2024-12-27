// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';

class MyListViewTestA extends StatelessWidget {
  const MyListViewTestA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2.5,
        title: const Text('List View Test A'),
      ),
      body: ListView.builder(
        itemCount: 1000,
        itemBuilder: (context, index) {
          print('Item is: $index');
        return Container(
          height: 150,
          color: Colors.primaries[index % Colors.primaries.length],
          child: Center(child: Text(index.toString(), style: kTxtBtnTextStyle,)),
        );
      },),
    );
  }
}