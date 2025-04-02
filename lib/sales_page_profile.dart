import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_imc_calc_app/modules/app_routes.dart';

class SalesPageProfile extends StatelessWidget {
  const SalesPageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sales Page Profile')),
            body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.cyanAccent,
              child: const Center(
                child: Text('Bem-vindo à Página de PERFIL de Vendas!'),
              ),
            ),
            const SizedBox(height: 120),
            ElevatedButton(
              onPressed: () {
                Modular.to.navigate(AppRoutes.initial); // Voltar para a tela inicial
              },
              child: const Text('Voltar à Tela Inicial'),
            ),
          ],
        ),
      ),
    );
  }
}
