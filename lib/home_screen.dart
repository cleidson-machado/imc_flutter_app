import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tela Inicial')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Modular.to.navigate('/login'); // Ir para Login
              },
              child: const Text('Ir para Login'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Modular.to.navigate('/home'); // Ir para Home (rota protegida)
              },
              child: const Text('Ir para Home'),
            ),
          ],
        ),
      ),
    );
  }
}
