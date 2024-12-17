import 'package:flutter/foundation.dart';
import 'package:my_imc_calc_app/Model/user_mesure.dart';

class UserDataProvider with ChangeNotifier {
  final List<UserMesure> _userDataList = [];

  List<UserMesure> get userDataList => _userDataList;

  void addUser(UserMesure user) {
    _userDataList.add(user);
    notifyListeners(); // Notify listeners to rebuild UI if needed
  }
}
