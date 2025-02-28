import 'auth_login_service.dart';
import 'auth_login_model.dart';

class AuthLoginController {
  final AuthLoginService _service;

  AuthLoginController(this._service);

  Future<List<AuthLoginModel>> getUsers() async {
    try {
      return await _service.fetchUsers();
    } catch (e) {
      
      return [];
    }
  }
}
