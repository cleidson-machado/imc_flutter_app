// ignore_for_file: use_super_parameters

import 'package:flutter/cupertino.dart';
import '../core/colors.dart';
import '../core/typography.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: AppColors.primary,
      onPressed: onPressed,
      child: Text(text, style: AppTypography.actionText),
    );
  }
}
