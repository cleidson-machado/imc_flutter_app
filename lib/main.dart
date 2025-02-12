import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_imc_calc_app/Model_Providers/user_data_provider.dart';
import 'package:my_imc_calc_app/pages/a_msn_page_handler/message_list_screen.dart';
import 'package:my_imc_calc_app/pages/a_rest_api_basic_%20consuming/note_list_page_example_a.dart';
import 'package:my_imc_calc_app/pages/a_rest_api_basic_%20consuming/note_list_page_example_b.dart';
import 'package:my_imc_calc_app/pages/a_rest_api_basic_%20consuming/note_list_page_example_c.dart';
import 'package:my_imc_calc_app/pages/a_rest_api_basic_%20consuming/note_list_page_example_d.dart';
import 'package:my_imc_calc_app/pages/combo_from_api_a/combo_index_page_one.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';
import 'package:my_imc_calc_app/pages/imc_stuff/my_calculator_page.dart';
import 'package:my_imc_calc_app/pages/imc_stuff/my_default_home_page.dart';
import 'package:my_imc_calc_app/pages/list_view_layout_and_performances_tests/my_list_view_test_a.dart';
import 'package:my_imc_calc_app/pages/my_index_projects_page.dart';
import 'package:my_imc_calc_app/pages/skeletonizer_demo_pages/skeletonizer_demo_page_a.dart';
import 'package:my_imc_calc_app/pages/tabs_tabbar_layout/tab_page_example_a.dart';
import 'package:my_imc_calc_app/pages/tabs_tabbar_layout/tab_page_example_b.dart';
import 'package:my_imc_calc_app/pages/tabs_tabbar_layout/tab_page_example_c.dart';
import 'package:my_imc_calc_app/service/notes_service.dart';
import 'package:provider/provider.dart';

//#################### This is my First Attempt to Create a simple Page Handler for some kind of MSN or ########################
//#################### SMS, Like a Ordinary email App, or something like that! #################################################


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
        '/calc': (context) => const MyDefaultHomePage(title: theAppTitle,),
        '/calculator': (context) => const MyCalculatorPage(title: theAppTitle,),
        '/comboIndexOne': (context) => const ComboIndexPageOne(title: theProjectTitleOne,),
        '/notesHomePageA': (context) => const NoteListPageExampleA(title: theProjectTitleTwo,),   //REST API TEST A
        '/listViewTestA': (context) => const MyListViewTestA(),
        '/notesHomePageB': (context) => const NoteListPageExampleB(title: theProjectTitleThree,), //REST API TEST B
        '/notesHomePageC': (context) => const NoteListPageExampleC(title: theProjectTitleSix,), //REST API TEST C
        '/tabsPageExampleA': (context) => const TabPageExampleA(title: theProjectTitleFour,),
        '/tabsPageExampleB': (context) => const TabPageExampleB(title: theProjectTitleFive,),
        '/notesHomePageD': (context) => const NoteListPageExampleD(title: theProjectTitleSeven,), //REST API TEST D Scroll Control
        '/skeletonPageA': (context) => const SkeletonizerDemoPageA(),
        '/tabsPageExampleC': (context) => const TabPageExampleC(title: theProjectTitleEight,), //REST API TEST Message Filters
        '/messageListScreen': (context) => const MessageListScreen(),
        // '/calculatorList': (context) => const MyCalculatorListPage(title: theAppTitle,),
      },
    );
  }
}
