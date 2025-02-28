// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'auth_login_controller.dart';
import 'auth_login_service.dart';

class AuthLoginPage extends StatelessWidget {
  const AuthLoginPage({super.key});

  void _showErrorDialog(BuildContext context, String message) {
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
    return ChangeNotifierProvider(
      create: (_) => AuthLoginController(AuthLoginService())
        ..getUsers(), // Load users on init
      child: Consumer<AuthLoginController>(
        builder: (context, controller, child) {
          if (controller.error.isNotEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _showErrorDialog(context, 'Erro ${controller.error}');
            });
          }
          return CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              middle: Text('Moc List of Users'),
            ),
            child: SafeArea(
              child: controller.isLoading
                  ? const Center(child: CupertinoActivityIndicator())
                  : controller.usersModel.isNotEmpty
                      ? Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: CupertinoListSection.insetGrouped(
                                  children: controller.usersModel.map((user) {
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
                                fontSize: 18,
                                color: CupertinoColors.systemGrey),
                          ),
                        ),
            ),
          );
        },
      ),
    );
  }
}
