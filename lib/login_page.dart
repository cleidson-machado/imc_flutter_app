import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_imc_calc_app/modules/app_routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Modular.to.navigate(AppRoutes.sales);
              },
              child: const Text('ir para a Sales Page Profile - Bloc Test1'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Modular.to.navigate(AppRoutes.admin);
              },
              child: const Text('ir para a Admin Page - Bloc Test2'),
            ),
          ),
        ],
      ),
    );
  }
}
