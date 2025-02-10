import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/auth/auth_gate.dart';
import 'package:my_imc_calc_app/firebase_options.dart';

//########################## REBUILD USING THE OFFICIAL DOC APPROACH ##########################

void main() async {

  //### START - Firebase Stuff ################################################################
  WidgetsFlutterBinding.ensureInitialized(); 
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    debugPrint('✅ Firebase initialized successfully');
  } catch (e) {
    debugPrint('❌ Firebase initialization failed: $e');
  }
  //### START - Firebase Stuff ################################################################

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthGate(),
    );
  }
}


//Fix ERROR: How to solve Include of non-modular header inside framework module 'firebase_auth.FLTAuthStateChannelStreamHandler'
//https://addmeta.co.jp/%E3%80%90flutter%E3%80%91lexical-or-preprocessor-issue-xcode-include-of-non-modular-header-inside-framework-module-firebase _auth-fltauthstatechannelstreamhandler/
