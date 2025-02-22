import 'package:flutter/cupertino.dart';

class AppTextField extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;

  const AppTextField({super.key, required this.placeholder, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
