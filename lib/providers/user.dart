import 'package:flutter/cupertino.dart';
import 'package:flutter_b4_v2/models/user.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _userModel;
  String? _token;

  void setUser(UserModel val) {
    _userModel = val;
    notifyListeners();
  }

  void setToken(String val) {
    _token = val;
    notifyListeners();
  }

  UserModel? getUser() => _userModel;

  String? getToken() => _token;
}
