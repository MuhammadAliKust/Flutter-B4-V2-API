import 'package:flutter/cupertino.dart';
import 'package:flutter_b4_v2/models/user.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _userModel;

  void setUser(UserModel val) {
    _userModel = val;
    notifyListeners();
  }

  UserModel? getUser() => _userModel;
}
