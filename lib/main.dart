import 'package:flutter/cupertino.dart';
import 'package:my_imc_calc_app/core/app_theme.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppTheme(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(
      builder: (context, appTheme, child) {
        return CupertinoApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme.themeData,
          home: const LoginScreen(),
        );
      },
    );
  }
}
