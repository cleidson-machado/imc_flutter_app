import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';

class ThirdTabPage extends StatelessWidget {
  const ThirdTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey,
        child: const Center(
          child: Text('Tab Page 03, I AM A SINGLE SEPARATE PAGE!!' , style: kTxtTabTitleListTextStyle),
        ),
      ),
    );
  }
}