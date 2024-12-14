import 'package:flutter/material.dart';

class DefaultCustomRoundedButtonComponent extends StatelessWidget {
  const DefaultCustomRoundedButtonComponent({super.key, required this.theIcon, required this.onAction});

  final IconData theIcon;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onAction,
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: const CircleBorder(),
      fillColor: const Color.fromARGB(255, 80, 84, 86),
      elevation: 3.0,
      child: Icon(theIcon),
    );
  }
}