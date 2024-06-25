// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram1/models/user.dart' as model;

class LikedUsersProvider extends ChangeNotifier {
  List<model.User> likedUsers = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchLikedUsersProfiles(List<dynamic> likedUserIds) async {
    isLoading = true;
    notifyListeners();

    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    for (String userId in likedUserIds) {
      try {
        DocumentSnapshot userProfile =
            await firestore.collection('users').doc(userId).get();
        model.User user = model.User.fromSnap(userProfile);

        if (!likedUsers.any((existingUser) => existingUser.uid == user.uid)) {
          likedUsers.add(user);
        }
      } catch (e) {
        print("Error fetching user profile: $e");
      }
    }

    isLoading = false;
    notifyListeners();

    print("liked user profiles now after adding as users is $likedUsers");
  }
}
