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
                Modular.to.navigate('/sales-page'); // Go to Sales Page (free route)
              },
              child: const Text('Go to Sales Page - Free'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Modular.to.navigate('/sales-page-profile'); // Go to Admin Page (free route)
              },
              child: const Text('Go to Sales Page Profile - Locked'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Modular.to.navigate('/admin-page'); // Go to Admin Page (protect route)
              },
              child: const Text('Go to Admin Page - Locked'),
            ),
          ],
        ),
      ),
    );
  }
}
