import 'package:flutter/foundation.dart';
import 'core_auth_login_service.dart';
import 'core_auth_login_model.dart';

class AuthLoginController extends ChangeNotifier {
  final AuthLoginService _service;

  AuthLoginController(this._service);

  var isLoading = false;
  var error = '';
  var usersModel = <AuthLoginModel>[];

  Future<List<AuthLoginModel>> getUsers() async {
    try {
      isLoading = true;
      notifyListeners(); // Notify UI about loading state

      final users = await _service.fetchUsers();
      usersModel = users;
      error = ''; // Clear any previous errors
    } catch (err) {
      error = err.toString();
      usersModel = []; // Ensure a list is always returned
    } finally {
      isLoading = false;
      notifyListeners(); // Notify UI about state change
    }

    return usersModel; // Always return a list
  }
}
