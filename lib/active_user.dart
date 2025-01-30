// ignore_for_file: avoid_print, unused_import

import 'user_state.dart';
import 'banned_user.dart';

class ActiveUser extends UserState {
  @override
  void login() {
    print('ActiveUser: Already logged in.');
  }

  @override
  void logout() {
    print('ActiveUser: Logging out...');
    //_user.changeState(BannedUser()); // ✅ Now correctly references _user
  }
}
