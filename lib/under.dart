import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Under extends StatefulWidget {
  const Under({Key? key}) : super(key: key);

  @override
  _UnderState createState() => _UnderState();
}

class _UnderState extends State<Under> {
  bool language = true;
  getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getBool('language')!;
    setState(() {});
  }

  @override
  void initState() {
    getLanguage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Text(
          language
              ? 'This page is under construction!'
              : 'পেজের গঠনমূলক কাজ চলছে',
          style: TextStyle(fontSize: 20),
        ),
      )),
    );
  }
}
