// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:my_imc_calc_app/util/error_messages.dart';
import 'package:my_imc_calc_app/widgets/custom_cupertino_dialog_widget.dart';
import 'package:provider/provider.dart';
import '../auth_login_controller.dart';
import '../auth_login_service.dart';

class AuthLoginPage extends StatelessWidget {
  const AuthLoginPage({super.key});

  

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
            navigationBar: CupertinoNavigationBar(
              middle: const Text('Moc List of Users'),
              trailing: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.arrow_down_doc_fill),
                onPressed: () {Provider.of<AuthLoginController>(context, listen: false).getUsers();
                },
              ),
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
                          child: Text(ErrorMessages.ERROR_FETCHING_USERS_MESSAGE,
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

void _showErrorDialog(BuildContext context, String message) {
    customCupertinoDialog(context, message);
}


