// ignore_for_file: avoid_print

import 'user_state.dart';

class User {
  UserState _state;

  User(this._state) {
    changeState(_state);
  }

  void changeState(UserState state) {
    print('User: Changing state to ${state.runtimeType}.');
    _state = state;
    _state.setUser(this); // ✅ Assign the user to the state
  }

  void login() {
    _state.login();
  }

  void logout() {
    _state.logout();
  }
}
