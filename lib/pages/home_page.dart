import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/auth/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {
    final auth = AuthService();
    auth.singOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        foregroundColor: Colors.white,
        title: const Text('My Home Page'),
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
