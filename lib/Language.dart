import 'package:flutter/material.dart';
import 'LoginScreen.dart';

class Language extends StatefulWidget {
  final bool language;
  Language({required this.language});
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  TextEditingController userId = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/download.png',
              height: 150.0,
              width: 150.0,
            ),
            Container(
              child: Text(
                widget.language ? 'Welcome' : 'স্বাগতম',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue[900],
                ),
              ),
            ),
            Container(
              child: Center(
                child: TextField(
                  controller: userId,
                  style: TextStyle(
                    fontSize: 18.39,
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                    hintText: widget.language
                        ? 'Enter your Guide Book Number'
                        //"Enter your Patient's Id/BNDR Id/Patient's Center Id/Mobile Number"
                        : 'আপনার গাইড বই নম্বর লিখুন',
                    //"আপনার রোগীর আইডি লিখুন/বিএনডিআর আইডি/রোগীর কেন্দ্রের আইডি/মোবাইল নম্বর",
                  ),
                ),
              ),
              margin: EdgeInsets.fromLTRB(42.0, 10.1428, 42.0, 5.1428),
            ),
            SizedBox(height: 26),
            Container(
              width: 330.0,
              height: 75.0,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(
                        type: 'patient_guide_book_no',
                        userId: userId.text,
                      ),
                    ),
                  );
                },
                child: Padding(
                  child: Text(widget.language
                      ? 'Set new Password'
                      : 'নতুন পাসওয়ার্ড সেট করুন'),
                  padding: EdgeInsets.all(20),
                ),
                style: OutlinedButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 30.0,
                  ),
                  primary: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide(color: Colors.blue.shade900),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
            ),
          ],
        ),
      ),
    );
  }
}
