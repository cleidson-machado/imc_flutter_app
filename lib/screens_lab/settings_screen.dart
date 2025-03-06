import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:my_imc_calc_app/app/theme/app_theme_provider_full.dart';

class SettingsScreen extends StatelessWidget {
  
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text("Settings")),
      child: Center(
        child: CupertinoButton(
          child: const Text("Toggle Theme"),
          onPressed: () {
            Provider.of<AppTheme>(context, listen: false).toggleTheme();
          },
        ),
      ),
    );
  }
}
