import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Model Class
class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
}

// Mock Data
final List<User> mockUsers = [
  User(name: 'Alice Johnson', email: 'alice.johnson@example.com'),
  User(name: 'Bob Smith', email: 'bob.smith@example.com'),
  User(name: 'Charlie Brown', email: 'charlie.brown@example.com'),
  User(name: 'Diana Prince', email: 'diana.prince@example.com'),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const UserListPage(),
    );
  }
}

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User List')),
      body: ListView.builder(
        itemCount: mockUsers.length,
        itemBuilder: (context, index) {
          final user = mockUsers[index];
          return ListTile(
            leading: CircleAvatar(child: Text(user.name[0])),
            title: Text(user.name),
            subtitle: Text(user.email),
            onTap: () {
              // Navigate to Detail Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailsPage(user: user),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class UserDetailsPage extends StatelessWidget {
  final User user;

  const UserDetailsPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${user.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: ${user.email}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
