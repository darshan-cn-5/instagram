// ignore_for_file: avoid_print

import 'package:flutter/widgets.dart';
import 'package:instagram1/models/user.dart';
import 'package:instagram1/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {

  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;

  Future<void> refreshUser() async {

    print("came to refresh user function inside the provider to print or call the user  data");
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
