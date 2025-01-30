// ignore_for_file: unused_field

import 'user.dart';

abstract class UserState {
  late User _user; // ✅ Holds a reference to the context

  User get user => _user; // Public getter for _user

  void setUser(User user) {
    _user = user; // ✅ Fix: Assign the user correctly
  }

  void login();
  void logout();
}
