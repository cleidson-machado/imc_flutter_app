import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pages/my_calculator_page.dart';
import 'package:my_imc_calc_app/pages/my_default_home_page.dart';

void main() {
  runApp(const MyApp());
}

const String theTitle = 'IMC CALCULATOR';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter IMC CALC Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), //### NOTE: This code don't do nothing at this level!.. Review!
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF616161),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightGreen,
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF616161),// Set AppBar color to black
          foregroundColor: Colors.white,
          shadowColor: Colors.black, // Ensure the text/icons are white
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      initialRoute: '/',
      routes: { 
        '/' : (context) => const MyDefaultHomePage(title: theTitle),
        '/calculator': (context) => const MyCalculatorPage(title: theTitle,)
        },
    );
  }
}
