// ignore_for_file: unused_import, unused_field, empty_catches

import "dart:io";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
  }) async {
    String res = "something error occured";

    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          bio.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

        _firestore.collection("users").doc(cred.user!.uid).set({
          "username": username,
          "email": email,
          "bio": bio,
          "password": password,
          "uid": cred.user!.uid,
          "followers": [],
          "following": [],
        });

        res = "success";
      }
    } catch (err) {}
    return res;
  }
}
