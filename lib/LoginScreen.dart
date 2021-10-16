import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomePage.dart';

import 'OTP.dart';
//import 'dart:async';

//import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  final String type;
  final String userId;
  LoginScreen({required this.userId, required this.type});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final firestoreInstance = FirebaseFirestore.instance;

  String name = '';
  String phoneNumber = '';
  String bndrId = '';
  String guideBookNo = '';
  String centerId = '';
  String registrationCenter = '';
  String password = '';
  String id = '';
  TextEditingController c1 = TextEditingController();
  var resX;
  TextEditingController c2 = TextEditingController();

  void _onPressed() async {
    var res = await FirebaseFirestore.instance
        .collection('s nagar 2')
        .where(widget.type, isEqualTo: widget.userId)
        .get();
    print(res.size);
    if (res.size == 0) {
      Get.offAll(HomePage());
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
        setState(() {
          id = res.id;
          getUser(id);
          // name = res.data()['patient_name'];
          phoneNumber = res.data()['patient_phone'];
          bndrId = res.data()['bndr_id'];
          guideBookNo = res.data()['patient_guide_book_no'];
          //  centerId = res.data()['patient_idby_center'];
          //  registrationCenter = res.data()['center_name'];
          password = res.data()['password'];
        });
      });
    }
  }

  void getUser(String idx) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('patientid_firebase', idx);
    var X = await FirebaseFirestore.instance
        .collection('s nagar 2')
        .doc(idx)
        .collection('visits')
        .doc('basicinfo')
        .get();
    setState(() {
      resX = X;
    });
  }

  void _update() async {
    firestoreInstance.collection('s nagar 2').doc(id).set(
        {'patient_phone': c1.text, 'password': ps1.text},
        SetOptions(merge: true)).then((_) {
      print("success!");
    });
  }

  void _remainSameNumber() async {
    firestoreInstance
        .collection('s nagar 2')
        .doc(id)
        .set({'password': ps1.text}, SetOptions(merge: true)).then((_) {
      print("success!");
    });
  }

  @override
  void initState() {
    _onPressed();
    //_update();

    super.initState();
  }

  final _loginForm = GlobalKey<FormState>();
  TextEditingController ps1 = TextEditingController();
  TextEditingController ps2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffF5F5F9),
      body: resX == null
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: _loginForm,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              InputTaker(
                                editable: false,
                                takeIcon: false,
                                title: language ? 'Full Name' : 'নাম',
                                hints: language
                                    ? resX.data()!['patient_name']
                                    : resX.data()!['patient_name'],
                                phnx: c2,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTaker(
                                editable: true,
                                takeIcon: true,
                                title: language ? 'Phone Number' : 'ফোন নম্বর',
                                hints: language ? phoneNumber : phoneNumber,
                                phnx: c1,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTaker(
                                editable: false,
                                takeIcon: false,
                                title: language ? 'BNDR ID' : 'বিএনডিআর আইডি',
                                hints: language ? bndrId : bndrId,
                                phnx: c2,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTaker(
                                editable: false,
                                takeIcon: false,
                                title:
                                    language ? 'Guide book No.' : 'গাইড বই নং.',
                                hints: language ? guideBookNo : guideBookNo,
                                phnx: c2,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTaker(
                                editable: false,
                                takeIcon: false,
                                title: language ? 'Center ID' : 'সেন্টার আইডি',
                                hints: language
                                    ? resX.data()!['patient_idby_center']
                                    : resX.data()!['patient_idby_center'],
                                phnx: c2,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTaker(
                                editable: false,
                                takeIcon: false,
                                title: language
                                    ? 'Registration Center'
                                    : 'নিবন্ধকরণ সেন্টার',
                                hints: language
                                    ? resX.data()!['center_name']
                                    : resX.data()!['center_name'],
                                phnx: c2,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          language ? 'Password' : 'পাসওয়ার্ড',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Container(
                        width: 370.0,
                        height: 60,
                        child: TextFormField(
                          style: TextStyle(fontSize: 16),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password can not be empty';
                            }

                            return null;
                          },
                          controller: ps1,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: language ? '6-9 Characters' : '৬-৯ অক্ষর',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white70, width: 1.0),
                            ),
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          language
                              ? 'Confirm Password'
                              : 'পাসওয়ার্ড নিশ্চিত করুন',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Container(
                        width: 370.0,
                        height: 60,
                        child: TextFormField(
                          style: TextStyle(fontSize: 16),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password can not be empty';
                            }

                            return null;
                          },
                          controller: ps2,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: language ? '6-9 Characters' : '৬-৯ অক্ষর',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white70, width: 1.0),
                            ),
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 137.0,
                            height: 62.6,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              },
                              child: Padding(
                                child: Text(language ? 'Cancel' : 'বাতিল'),
                                padding: EdgeInsets.all(20),
                              ),
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                ),
                                primary: Colors.white,
                                onPrimary: Colors.black,
                                shape: StadiumBorder(),
                                side: BorderSide(color: Colors.black38),
                              ),
                            ),
                            margin: EdgeInsets.all(12.0),
                          ),
                          Container(
                            width: 137.0,
                            height: 62.6,
                            child: ElevatedButton(
                              onPressed: () {
                                if (true) {
                                  if (password != ps1.text) {
                                    if (ps1.text == ps2.text) {
                                      if (ps1.text.length >= 6 &&
                                          ps1.text.length <= 9) {
                                        if (c1.text.length == 11) {
                                          _update();
                                          Get.to(OTP(c1.text));
                                        } else if (c1.text.length == 0) {
                                          _remainSameNumber();
                                          Get.to(OTP(phoneNumber));
                                        } else {
                                          Get.snackbar(
                                              language
                                                  ? 'Something went wrong'
                                                  : 'কিছু ভুল হয়েছে',
                                              language
                                                  ? 'Your mobile number must contain 11 digits'
                                                  : 'আপনার মোবাইল নম্বরে অবশ্যই ১১ টি সংখ্যা থাকতে হবে');
                                        }
                                      } else {
                                        Get.snackbar(
                                            language
                                                ? 'Something went wrong'
                                                : 'কিছু ভুল হয়েছে',
                                            language
                                                ? 'Your password must be 6-9 characters'
                                                : 'আপনার পাসওয়ার্ড ৬-৯ অক্ষরের হতে হবে');
                                      }
                                    } else {
                                      Get.snackbar(
                                          language
                                              ? 'Something went wrong'
                                              : 'কিছু ভুল হয়েছে',
                                          language
                                              ? 'Your both password must be same'
                                              : 'আপনার উভয় পাসওয়ার্ড একই হতে হবে');
                                    }
                                  } else {
                                    Get.snackbar(
                                        language
                                            ? 'Something went wrong'
                                            : 'কিছু ভুল হয়েছে',
                                        language
                                            ? 'Your new password must be different from your previous password'
                                            : 'আপনার নতুন পাসওয়ার্ড আপনার আগের পাসওয়ার্ডের থেকে আলাদা হতে হবে');
                                  }
                                }
                              },
                              child: Padding(
                                child: Text(language ? 'Login' : 'প্রবেশ'),
                                padding: EdgeInsets.all(20),
                              ),
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                ),
                                primary: Colors.blue[900],
                                onPrimary: Colors.white,
                                shape: StadiumBorder(),
                                side: BorderSide(color: Colors.blue.shade900),
                              ),
                            ),
                            margin: EdgeInsets.all(30.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class InputTaker extends StatelessWidget {
  final String title;
  final bool takeIcon;
  final String hints;
  final bool editable;
  final TextEditingController phnx;
  InputTaker(
      {required this.title,
      required this.takeIcon,
      required this.hints,
      required this.editable,
      required this.phnx});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            child: Row(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                ),
                takeIcon
                    ? Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Icon(Icons.mode),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Expanded(
          flex: 6,
          child: Container(
            padding: EdgeInsets.fromLTRB(4, 6, 2, 4),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
            ),
            height: 40,
            child: !editable
                ? Wrap(
                    children: [
                      Text(
                        hints,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                : TextField(
                    controller: phnx,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: hints,
                      border: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
