// ignore_for_file: prefer_const_constructors, avoid_print

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  String userName = "";
  @override
  void initState() {
    super.initState();
    getUserName();
  }

  void getUserName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    ;
    print("user data is $snap");
    setState(() {
      userName = (snap.data() as Map<String, dynamic>)['username'];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("mobile screen layout"),
      ),
    );
  }
}
