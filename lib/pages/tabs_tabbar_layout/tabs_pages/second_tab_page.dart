import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';

class SecondTabPage extends StatelessWidget {
  const SecondTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: const Center(
          child: Text('Tab Page 02, I AM A SINGLE SEPARATE PAGE!!' , style: kTxtTabTitleListTextStyle),
        ),
      ),
    );
  }
}