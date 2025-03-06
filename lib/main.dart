import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_imc_calc_app/app_main_widget.dart';
import 'package:my_imc_calc_app/theme/app_theme_provider_full.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //############# Function to ensure Flutter is initialized before loading the .ENV file!!..
  await dotenv.load(fileName: ".env");
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppTheme(), // Alterado para AppTheme Melhorado
      child: const AppMainWidget(),
    ),
  );
}


// VERIFICAR AINDA SE ALTERA NOME DE AppTheme PARA AppThemePpvider e exclui o anterior da IA
// COMO UTILIZAR O CÓDIGO MAIS COMPLETO DA HOME
// SE ...
// lib/features_domain/home_content/screens/home_screen.dart //## recomeçar?? usar em melhorar a da IA
// lib/screens/home_screen_original_com_nav.dart //## usar a minha antiga mas tb melhorando