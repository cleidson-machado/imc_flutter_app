import 'package:flutter/material.dart';

class ButtonIndexContainerComponent extends StatelessWidget {
  const ButtonIndexContainerComponent(
      {super.key, required this.txtButtonTitle});

  final String txtButtonTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: Colors.white,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Text(
            txtButtonTitle.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
        ),
      ),
    );
  }
}
