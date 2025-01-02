import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';

class ListMessagesTabPage extends StatelessWidget {
  const ListMessagesTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.pink,
        child: const Center(
          child: Text('LIST ALL THE MSN,s' , style: kTxtTabTitleListTextStyle),
        ),
      ),
    );
  }
}