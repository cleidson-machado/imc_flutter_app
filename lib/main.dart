import 'package:flutter/cupertino.dart';
import 'package:my_imc_calc_app/core/theme.dart';
import 'package:my_imc_calc_app/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: AppTheme.theme,
      home: HomeScreen(),
    );
  }
}
