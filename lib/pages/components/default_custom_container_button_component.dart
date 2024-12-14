import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';

class DefaultCustomContainerButtonComponent extends StatelessWidget {
    const DefaultCustomContainerButtonComponent({super.key,  required this.txtButtonTitle});

    final String txtButtonTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.inversePrimary,
      margin: const EdgeInsets.only(top: 10.0),
      height: kHeightBottomPageContainer,
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Center(
        child: Text(
          txtButtonTitle.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}