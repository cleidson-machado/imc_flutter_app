// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'auth_login_controller.dart';
import 'auth_login_service.dart';
import 'auth_login_model.dart';

class AuthLoginPage extends StatefulWidget {
  const AuthLoginPage({super.key});

  @override
  _AuthLoginPageState createState() => _AuthLoginPageState();
}

class _AuthLoginPageState extends State<AuthLoginPage> {
  late AuthLoginController _controller;
  List<AuthLoginModel> _users = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = AuthLoginController(AuthLoginService());
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final users = await _controller.getUsers();
    setState(() {
      _users = users;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Moc List of Users'),
      ),
      child: SafeArea(
        child: _isLoading
            ? const Center(child: CupertinoActivityIndicator())
            : Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: CupertinoListSection.insetGrouped(
                        children: _users.map((user) {
                          return CupertinoListTile(
                            title: Text(user.username),
                            subtitle: Text(user.email),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
