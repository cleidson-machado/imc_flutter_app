import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';

class FirstTabPage extends StatelessWidget {
  const FirstTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.pink,
        child: const Center(
          child: Text('Tab Page 01, I AM A SINGLE SEPARATE PAGE!!' , style: kTxtTabTitleListTextStyle),
        ),
      ),
    );
  }
}