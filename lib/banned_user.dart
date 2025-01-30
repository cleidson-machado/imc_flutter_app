// ignore_for_file: avoid_print, unused_import

import 'user_state.dart';
import 'active_user.dart';

class BannedUser extends UserState {
  @override
  void login() {
    print('BannedUser: Cannot log in. User is banned.');
  }

  @override
  void logout() {
    print('BannedUser: Already logged out.');
  }
}
