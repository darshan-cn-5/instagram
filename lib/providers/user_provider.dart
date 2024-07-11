// ignore_for_file: avoid_print

import 'package:flutter/widgets.dart';
import 'package:instagram1/models/user.dart';
import 'package:instagram1/resources/auth_methods.dart';
import 'package:instagram1/resources/firestore_methods.dart';

class UserProvider with ChangeNotifier{
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;
  List<dynamic>? _savedPostIds = [];

  List<dynamic>? get savedPostIds => _savedPostIds;

  set savedPostIds(List<dynamic>? savedpostids){
    _savedPostIds = savedpostids;
    notifyListeners();
  }

  Future<void> refreshUser() async{
    print(
        "came to refresh user function inside the provider to print or call the user  data");
    User user = await _authMethods.getUserDetails();
    _user = user;
    savedPostIds = user.savedPostIds;
    notifyListeners();
  }

  set addPostId(String postid) {
    _savedPostIds!.add(postid);
    notifyListeners();
    addPostIdtoUserCart(postid);
  }

  set removePostId(String postid) {
    _savedPostIds!.remove(postid);
    notifyListeners();
    removePostIdfromUserCart(postid);
  }

  Future<void> addPostIdtoUserCart(String value) async {
    try {
      await FireStoreMethods().savePost(value);
      print("successfully added to the firestore of the user cart add data");
    } catch (err) {
      print(" catch error  ocured while adding the postID to the cart $err");
    }
  }

  Future<void> removePostIdfromUserCart(String value) async {
    try {
      await FireStoreMethods().removePost(value);
      print(
          "successfully removed from the firestore of the user cart remove data");
    } catch (err) {
      print(
          " catch error  ocured while removing the postID from the cart $err");
    }
  }
}
