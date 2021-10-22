import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Report.dart';
//import 'LoginScreen.dart';

class ActualLogin extends StatefulWidget {
  const ActualLogin({Key? key}) : super(key: key);

  @override
  _ActualLoginState createState() => _ActualLoginState();
}

class _ActualLoginState extends State<ActualLogin> {
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

  void _onPressed(String id) async {
    var res = await FirebaseFirestore.instance
        .collection('s nagar 2')
        .where('patient_guide_book_no', isEqualTo: id)
        .get();
    print(res.size);
    if (res.size == 0) {
      Get.defaultDialog(
          title: language
              ? 'No user found with this guide book'
              : 'এই গাইড বই ব্যবহারকারী পাওয়া যায়নি',
          middleText:
              language ? 'Try again please' : 'অনুগ্রহ করে আবার চেষ্টা করুন',
          middleTextStyle: TextStyle(
            color: Colors.black,
          ));
    } else {
      res.docs.forEach((res) async {
        SharedPreferences preferences = await SharedPreferences.getInstance();

        setState(() {
          var c = res.id;
          preferences.setString('patientid_firebase', c);
          var password = res.data()['password'];
          if (password == passC.text) {
            Get.offAll(Report());
          } else {
            Get.snackbar('', language ? 'Wrong Password' : 'ভুল পাসওয়ার্ড');
          }
        });
      });
    }
  }

  TextEditingController passC = TextEditingController();
  TextEditingController guidC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
                  language ? 'Login' : 'প্রবেশ করুন',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue[900],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Center(
                  child: TextField(
                    controller: guidC,
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
                      hintText: language
                          ? 'Enter your Guide Book Number'
                          //"Enter your Patient's Id/BNDR Id/Patient's Center Id/Mobile Number"
                          : 'আপনার গাইড বই নম্বর লিখুন',
                      //"আপনার রোগীর আইডি লিখুন/বিএনডিআর আইডি/রোগীর কেন্দ্রের আইডি/মোবাইল নম্বর",
                    ),
                  ),
                ),
                margin: EdgeInsets.fromLTRB(42.0, 10.1428, 42.0, 10.1428),
              ),
              Container(
                child: Center(
                  child: TextField(
                    obscureText: false,
                    controller: passC,
                    style: TextStyle(
                      fontSize: 18.39,
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      hintText: language
                          ? 'Enter your password here'
                          : 'এখানে আপনার পাসওয়ার্ড লিখুন',
                    ),
                  ),
                ),
                margin: EdgeInsets.fromLTRB(42.0, 10.1428, 42.0, 10.1428),
              ),
              SizedBox(
                height: 26,
              ),
              Container(
                width: 330.0,
                height: 75.0,
                child: OutlinedButton(
                  onPressed: () {
                    if (passC.text.length != 0 && guidC.text.length != 0) {
                      _onPressed(guidC.text);
                    } else {
                      Get.snackbar(
                          '', language ? 'Incomplete Data' : 'অসম্পূর্ণ ডেটা');
                    }
                  },
                  child: Padding(
                    child: Text(language ? 'Login' : 'প্রবেশ'),
                    padding: EdgeInsets.all(20),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    textStyle: TextStyle(
                      fontSize: 30.0,
                    ),
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(),
                  ),
                ),
              ),
              SizedBox(
                height: 35.0,
              ),
              // Container(
              //   padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
              //   width: MediaQuery.of(context).size.width,
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: <Widget>[
              //         GestureDetector(
              //           child: Text(
              //             language
              //                 ? 'Forget password?'
              //                 : 'পাসওয়ার্ড ভুলে গেছেন?',
              //             style: TextStyle(
              //               fontSize: 15.0,
              //               color: Colors.blue[900],
              //             ),
              //           ),
              //           onTap: () {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => LoginScreen(
              //                   type: '',
              //                   userId: '',
              //                 ),
              //               ),
              //             );
              //           },
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Container(
              //   padding: EdgeInsets.only(left: 110, right: 15, bottom: 10),
              //   width: MediaQuery.of(context).size.width,
              //   child: SingleChildScrollView(
              //     child: Row(
              //       children: [
              //         Column(
              //           children: <Widget>[
              //             Text(
              //               language ? 'Language' : 'ভাষা',
              //               style: TextStyle(
              //                 fontSize: 15.0,
              //                 color: Colors.blue[900],
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           width: 10.0,
              //         ),
              //         Column(
              //           children: <Widget>[
              //             Text(
              //               'বাংলা',
              //               style: TextStyle(
              //                 fontSize: 15.0,
              //                 color: Colors.blue[900],
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           width: 10.0,
              //         ),
              //         Column(
              //           children: <Widget>[
              //             Text(
              //               'English',
              //               style: TextStyle(
              //                 fontSize: 15.0,
              //                 color: Colors.blue[900],
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Padding(padding: EdgeInsets.all(2.0)),
            ],
          ),
        ),
      ),
    );
  }
}
