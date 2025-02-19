import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_imc_calc_app/resources/international/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _currentLocale = const Locale('pt', ''); // Default language

  void _changeLanguage(Locale newLocale) {
    setState(() {
      _currentLocale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _currentLocale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('es', ''), // Spanish
        Locale('pt', ''), // Portuguese
        Locale('fr', ''), // French
      ],
      home: MyHomePage(onLanguageChange: _changeLanguage),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Function(Locale) onLanguageChange;

  const MyHomePage({super.key, required this.onLanguageChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.hello),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(AppLocalizations.of(context)!.welcome),
          ),
          Center(
            child: Text(AppLocalizations.of(context)!.myTextTerm),
          ),
          const SizedBox(height: 20),
          DropdownButton<Locale>(
            
            value: Localizations.localeOf(context),
            onChanged: (Locale? newLocale) {
              if (newLocale != null) {
                onLanguageChange(newLocale);
              }
            },

            items: [
              DropdownMenuItem(
                value: const Locale('en', ''),
                child: Text(AppLocalizations.of(context)!.languageEnglish),
              ),
              DropdownMenuItem(
                value: const Locale('es', ''),
                child: Text(AppLocalizations.of(context)!.languageSpanish),
              ),
              DropdownMenuItem(
                value: const Locale('pt', ''),
                child: Text(AppLocalizations.of(context)!.languagePortuguese),
              ),
              DropdownMenuItem(
                value: const Locale('fr', ''),
                child: Text(AppLocalizations.of(context)!.languageFrench),
              ),
            ],
            
          ),
        ],
      ),
    );
  }
}
