import 'package:flutter/material.dart';

class DefaultCardContainerComponent extends StatelessWidget {
  const DefaultCardContainerComponent(
      {super.key, required this.cardColor, required this.cardChildContent});

  final Color cardColor;
  final Widget cardChildContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: cardChildContent,
    );
  }
}