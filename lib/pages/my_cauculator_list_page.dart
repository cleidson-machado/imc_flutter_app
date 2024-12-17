// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/Model/user_mesure.dart';

class MyCalculatorListPage extends StatefulWidget {
  final String title;
  final List<UserMesure> shareData;

  const MyCalculatorListPage({
    super.key,
    required this.title,
    required this.shareData,
  });

  @override
  State<MyCalculatorListPage> createState() => _MyCalculatorListPageState();
}

class _MyCalculatorListPageState extends State<MyCalculatorListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2.5,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: widget.shareData.length,
        itemBuilder: (context, index) {
          final userMesure = widget.shareData[index];
          return ListTile(
            title: Text('Weight: ${userMesure.bodyWeight}'),
            subtitle: Text('Height: ${userMesure.bodyHeight}'),
          );
        },
      ),
    );
  }
}
