import 'package:flutter/cupertino.dart';
import 'package:my_imc_calc_app/core/routes/app_routes.dart';
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
    return Consumer<AppTheme>(
      builder: (context, appTheme, child) {
        return CupertinoApp(
          title: 'Meu App Cupertino',//ESSE TXT NÃO APARECE NO VISUAL VERIFICAR......
          theme: appTheme.themeData,
          onGenerateRoute: AppRoutes.generateRoute, // Usando nosso método otimizado.
          initialRoute: AppRoutes.home,
          debugShowCheckedModeBanner: false, //############ THE ORIGINAL DEBUG FLAG...
        );
      },
    );
  }
}
