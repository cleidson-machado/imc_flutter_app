import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/Model/user_data_provider.dart';
import 'package:provider/provider.dart';

class MyCalculatorListPage extends StatelessWidget {
  final String title;

  const MyCalculatorListPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final userDataList = Provider.of<UserDataProvider>(context).userDataList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2.5,
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: userDataList.length,
        itemBuilder: (context, index) {
          final user = userDataList[index];
          return ListTile(
            title: Text(
              'Height: ${user.bodyHeight}, Weight: ${user.bodyWeight}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
                'Idade: ${user.bodyAge}, Sexo: ${user.bodyGender}, \n Label: ${user.txtLabel}, \n ImcValue: ${user.imcCalc}, \n Advice: ${user.txtInterpretation}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                )),
          );
        },
      ),
    );
  }
}
