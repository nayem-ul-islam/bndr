//import 'package:bndr/Splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ActualLogin.dart';
import 'HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'Splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  bool isLoggedIn = await isAuthenticate();

  return runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? ActualLogin() : HomePage(),
    ),
  );
}

Future<bool> isAuthenticate() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool result = false;
  if (prefs.getBool('authenticate') == true) {
    result = true;
  }
  return result;
}
