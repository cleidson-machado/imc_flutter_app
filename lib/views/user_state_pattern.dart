// ignore_for_file: avoid_print

class User {
  UserState _state;

  User(this._state) {
    changeState(_state);
  }

  void changeState(UserState state) {
    print('User: Changing state to ${state.runtimeType}.');
    _state = state;
    _state.setUser(this);
  }

  void login() {
    _state.login();
  }

  void logout() {
    _state.logout();
  }
}

abstract class UserState {
  late User _user;

  void setUser(User user) {
    _user = user;
  }

  void login();
  void logout();
}

class ActiveUser extends UserState {
  @override
  void login() {
    print('ActiveUser: Already logged in.');
  }

  @override
  void logout() {
    print('ActiveUser: Logging out...');
    _user.changeState(BannedUser());
  }
}

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

void main() {
  final user = User(ActiveUser());

  user.login();  // Output: Already logged in.
  user.logout(); // Output: Logging out... → Changing to BannedUser
  user.login();  // Output: Cannot log in. User is banned.
}
