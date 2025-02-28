// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_imc_calc_app/screens/settings_screen.dart';
import 'package:my_imc_calc_app/theme/app_theme.dart';
import 'package:my_imc_calc_app/screens/home_screen.dart';
import 'package:my_imc_calc_app/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //############# Function to ensure Flutter is initialized before loading the .ENV file!!..
  await dotenv.load(fileName: ".env");
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
    print(dotenv.env['API_END_POIN_TEST']); //############# TEST API USE!!..
    print(dotenv.env); //################################## Print all environment variables..
    return Consumer<AppTheme>(
      builder: (context, appTheme, child) {
        return CupertinoApp(
          debugShowCheckedModeBanner: false, //############# THE ORIGINAL DEBUG FLAG...
          theme: appTheme.themeData,
          home: const LoginScreen(),
        );
      },
    );
  }
}
