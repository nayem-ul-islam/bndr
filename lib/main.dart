import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'dart:async';

//import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}
