import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_imc_calc_app/Model/user_data_provider.dart';
import 'package:my_imc_calc_app/pages/a_rest_api_basic_%20consuming/note_list_page.dart';
import 'package:my_imc_calc_app/pages/combo_from_api_a/combo_index_page_one.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';
import 'package:my_imc_calc_app/pages/imc_stuff/my_calculator_page.dart';
import 'package:my_imc_calc_app/pages/imc_stuff/my_default_home_page.dart';
import 'package:my_imc_calc_app/pages/my_index_projects_page.dart';
import 'package:my_imc_calc_app/service/notes_service.dart';
import 'package:provider/provider.dart';  


void setupLocator() {
  GetIt.I.registerLazySingleton(() => NotesService()); //### USED ON THE FIRST TEST OF - NOTES FROM  A BASIC API ###
}

void main() {
  setupLocator();
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserDataProvider(), //### USED ON THE FIRST TEST OF - IMC CALCULATOR ###
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: theAppTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors
                .deepPurple), //### NOTE: This code don't do nothing at this level!.. Review!
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF616161),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightGreen,
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF616161), // Set AppBar color to black
          foregroundColor: Colors.white,
          shadowColor: Colors.black, // Ensure the text/icons are white
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyIndexProjectsPage(),
        '/calc': (context) => const MyDefaultHomePage(title: theAppTitle),
        '/calculator': (context) => const MyCalculatorPage(title: theAppTitle),
        '/comboIndexOne': (context) => const ComboIndexPageOne(title: theProjectTitleOne),
        '/notesHomePage': (context) => const NoteListPage(title: theProjectTitleTwo),
        // '/calculatorList': (context) => const MyCalculatorListPage(title: theAppTitle,),
      },
    );
  }
}
