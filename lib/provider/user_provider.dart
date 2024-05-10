import 'package:flutter/material.dart';
import 'package:maclay_shop_node_project/models/user_models.dart';

class UserProvider extends ChangeNotifier {
  UserModel _user = UserModel(
      id: '',
      name: '',
      email: '',
      password: '',
      address: '',
      type: '',
      token: '');

  UserModel get user => _user;

  void setUser(String user) {
    _user = UserModel.fromJson(user);
    notifyListeners();
  }

  void clearUser() {
    _user = UserModel(
      id: '',
      name: '',
      email: '',
      password: '',
      address: '',
      type: '',
      token: '');
    notifyListeners();
  }

 
}
