// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram1/firebase_options.dart';
import 'package:instagram1/responsive/mobile_screen_layout.dart';
import 'package:instagram1/responsive/responsive_layout.dart';
import 'package:instagram1/responsive/web_screen_layout.dart';
import 'package:instagram1/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoginScreen(),
    );
  }
}
