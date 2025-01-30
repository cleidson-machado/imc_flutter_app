import 'package:flutter/material.dart';
import 'user.dart';
import 'active_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User user;

  @override
  void initState() {
    super.initState();
    user = User(ActiveUser()); // Start with an active user
  }

  void login() {
    setState(() {
      user.login();
    });
  }

  void logout() {
    setState(() {
      user.logout();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('State Pattern Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "User State Pattern Demo",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: const Text("Login"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: logout,
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
