import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_imc_calc_app/app_main_widget.dart';
import 'package:my_imc_calc_app/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //############# Function to ensure Flutter is initialized before loading the .ENV file!!..
  await dotenv.load(fileName: ".env");
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppTheme(),
      child: const AppMainWidget(),
    ),
  );
}
