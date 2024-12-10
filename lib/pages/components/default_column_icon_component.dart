import 'package:flutter/material.dart';

//### Constants-Variables
const txtGenderTitleStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

class DefaultColumnIconComponent extends StatelessWidget {
  final String txtGenderTitle;
  final IconData iconTypeInfo;
  final String txtInfoOnOff;

  const DefaultColumnIconComponent(
      {super.key,
      required this.txtGenderTitle,
      required this.iconTypeInfo,
      required this.txtInfoOnOff});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconTypeInfo, size: 95.0),
        const SizedBox(height: 15.0),
        Text(txtGenderTitle, style: txtGenderTitleStyle),
        const SizedBox(
          height: 10.0,
        ),
        Text(txtInfoOnOff,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.lightGreenAccent,
            )),
      ],
    );
  }
}
