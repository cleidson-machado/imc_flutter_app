// ignore_for_file: library_private_types_in_public_api

import 'package:dio/dio.dart';
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

    try {
      final users = await _controller.getUsers();
      setState(() {
        _users = users;
        _isLoading = false;
      });
    } catch (err) {
      setState(() {
        _isLoading = false;
      });

      // Extract only the HTTP status code
      int? statusCode;
      if (err is DioException && err.response != null) {
        statusCode = err.response?.statusCode;
      }

      // Show only the status code in the error message
      _showErrorDialog(
          statusCode != null ? 'Erro $statusCode' : 'Erro desconhecido');
    }
    
  }

  void _showErrorDialog(String message) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Erro'),
          content: Text(message),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
            : _users.isNotEmpty
                ? Column(
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
                  )
                : const Center(
                    child: Text(
                      'Nenhum usuário encontrado',
                      style: TextStyle(
                          fontSize: 18, color: CupertinoColors.systemGrey),
                    ),
                  ),
      ),
    );
  }
}
