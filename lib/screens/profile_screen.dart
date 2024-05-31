// ignore_for_file: prefer_const_constructors, use_super_parameters

import "package:flutter/material.dart";
import "package:instagram1/resources/auth_methods.dart";

class ProfileScreen extends StatefulWidget {
  final String uid;
  const ProfileScreen({Key? key, required this.uid}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            AuthMethods().signOut();
          },
          child: Container(
              color: Colors.blue,
              child: Text(
                "Profile Screen",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
