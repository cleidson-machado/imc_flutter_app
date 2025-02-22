import 'package:flutter/cupertino.dart';
import 'package:my_imc_calc_app/core/colors.dart';
import 'package:my_imc_calc_app/core/typography.dart';

class AppTheme {
  static CupertinoThemeData get theme {
    return const CupertinoThemeData(
      primaryColor: AppColors.primary,
      barBackgroundColor: CupertinoColors.systemGrey6,
      scaffoldBackgroundColor: CupertinoColors.white,
      textTheme: CupertinoTextThemeData(
        textStyle: AppTypography.body,
        navTitleTextStyle: AppTypography.navTitle,
        actionTextStyle: AppTypography.actionText,
      ),
    );
  }
}
