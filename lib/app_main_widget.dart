
// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_imc_calc_app/features_domain/auth_login/screens/auth_login_screen.dart';
import 'package:my_imc_calc_app/screens/home_screen.dart';
import 'package:my_imc_calc_app/screens/login_screen.dart';
import 'package:my_imc_calc_app/theme/app_theme.dart';
import 'package:provider/provider.dart';

class AppMainWidget extends StatefulWidget {
  const AppMainWidget({super.key});

  @override
  State<AppMainWidget> createState() => _AppMainWidgetState();
}

class _AppMainWidgetState extends State<AppMainWidget> {
  @override
  Widget build(BuildContext context) {
    //print(dotenv.env['API_END_POIN_TEST']); //############# TEST API USE!!..
    //print(dotenv.env); //################################## Print all environment variables..
    return Consumer<AppTheme>(
      builder: (context, appTheme, child) {
        return CupertinoApp(
          debugShowCheckedModeBanner: false, //############ THE ORIGINAL DEBUG FLAG...
          theme: appTheme.themeData,
          home: const AuthLoginPage(),
        );
      },
    );
  }
}