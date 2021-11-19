import 'dart:ui';

import 'package:bndr/under.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ActualLogin.dart';
import 'Profile.dart';
import 'under.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  bool language = true;
  getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getBool('language')!;
    setState(() {});
  }

  ScrollController _controller = ScrollController(initialScrollOffset: 300.0);
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    getLanguage();
    getUser();
    _controller = ScrollController();
    super.initState();
  }

  var basicInfo;
  var resX,
      i,
      date = '',
      weight = '',
      height = '',
      sittingDbp = '',
      sittingSbp = '',
      fbg = '',
      tChol = '',
      hag = '',
      tg = '',
      rbg = '',
      ldlC = '',
      hba1c = '',
      hdlC = '',
      sCreatinine = '',
      sgpt = '',
      urineAlbumin = '',
      ecg = '',
      urineAcetone = '',
      dcN = '',
      dcM = '',
      dcZ = '',
      dcE = '',
      usg = '',
      hb = '',
      tc = '',
      visitCenter = '';
  void getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var y = preferences.getString('patientid_firebase');

    basicInfo = await FirebaseFirestore.instance
        .collection('s nagar 2')
        .doc(y)
        .collection('visits')
        .doc('basicinfo')
        .get();

    for (var j = 0; j < 12; j++) {
      var X = await FirebaseFirestore.instance
          .collection('s nagar 2')
          .doc(y)
          .collection('visits')
          .doc('visit$j')
          .get();

      if (X.exists) {
        String datex = X.data()!['v${j}_visit_date'] ?? '';

        visitCenter = X.data()!['v${j}_visit_center'] ?? '';

        if (datex.contains('-')) {
          setState(() {
            resX = X;
            i = j;
            print('cc $i');
            date = X.data()!['v${j}_visit_date'];
            weight = X.data()!['v${j}_weight'];
            height = X.data()!['v${j}_height'];
            sittingDbp = X.data()!['v${j}_sitting_dbp'];
            sittingSbp = X.data()!['v${j}_sitting_sbp'];
            fbg = X.data()!['v${j}_fbg'];
            tChol = X.data()!['v${j}_t_chol'];
            hag = X.data()!['v${j}_2hag'];
            tg = X.data()!['v${j}_tg'];
            rbg = X.data()!['v${j}_rbg'];
            ldlC = X.data()!['v${j}_ldl_c'];
            hba1c = X.data()!['v${j}_hba1c'];
            hdlC = X.data()!['v${j}_hdl_c'];
            sCreatinine = X.data()!['v${j}_s_creatinine'];
            sgpt = X.data()!['v${j}_sgpt'];
            urineAlbumin = X.data()!['v${j}_urine_albumin'];
            ecg = X.data()!['v${j}_ecg'];
            urineAcetone = X.data()!['v${j}_urine_acetone'];
            dcN = X.data()!['v${j}_dc_n'];
            dcM = X.data()!['v${j}_dc_m'];
            dcZ = X.data()!['v${j}_dc_z'];
            dcE = X.data()!['v${j}_dc_e'];
            usg = X.data()!['v${j}_usg_abnormals'];
            hb = X.data()!['v${j}_hb'];
            tc = X.data()!['v${j}_tc'];
            visitCenter = X.data()!['v${j}_visit_center'];
          });
          break;
        }
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return resX == null
        ? Center(
            child: Scaffold(
              body: Container(
                child: Center(
                  child: Text(
                    language
                        ? 'Fetching Data from the server'
                        : 'সার্ভার থেকে ডেটা আনা হচ্ছে',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ),
          )
        : Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              leading: IconButton(
                padding: const EdgeInsets.fromLTRB(25, 10, 55, 30),
                icon: Icon(Icons.menu, size: 40),
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              ),
              actions: <Widget>[
                IconButton(
                  padding: const EdgeInsets.fromLTRB(25, 10, 55, 30),
                  icon: Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(),
                      ),
                    );
                  },
                )
              ],
            ),
            drawer: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.blue[600],
              ),
              child: Container(
                width: 250,
                child: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.description_outlined,
                          color: Colors.white,
                        ),
                        title: Text(
                          language ? 'Reports' : 'রিপোর্ট',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Report(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.medical_services_outlined,
                          color: Colors.white,
                        ),
                        title: Text(
                          language ? 'Treatment' : 'চিকিৎসা',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Under(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.show_chart,
                          color: Colors.white,
                        ),
                        title: Text(
                          language ? 'Report Graph' : 'রিপোর্ট গ্রাফ',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Under(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.medical_services,
                          color: Colors.white,
                        ),
                        title: Text(
                          language ? 'Doctors' : 'ডাক্তার',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Under(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.local_pharmacy_sharp,
                          color: Colors.white,
                        ),
                        title: Text(
                          language ? 'Pharmacy' : 'ফার্মেসী',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Under(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.corporate_fare,
                          color: Colors.white,
                        ),
                        title: Text(
                          language ? 'BADAS Center' : 'বাডাস সেন্টার',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Under(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.logout_outlined,
                          color: Colors.white,
                        ),
                        title: Text(
                          language ? 'Logout' : 'লগআউট',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ActualLogin(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, right: 5),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ActualLogin(),
                                ),
                              );
                            },
                            child: Padding(
                              child: Text(
                                language ? 'Logout' : 'লগআউট',
                              ),
                              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            ),
                            style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(
                                fontSize: 18,
                              ),
                              primary: Colors.blue[600],
                              onPrimary: Colors.white,
                              shape: StadiumBorder(),
                              side: BorderSide(color: Colors.blue.shade900),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 35),
                                  child: Text(
                                    language ? '' : '',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    basicInfo.data()['patient_name'],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Row(
                                children: [
                                  Text(
                                    '<',
                                    style: TextStyle(
                                      color: Colors.blue[900],
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    language ? 'View Visits' : 'ভিজিট দেখুন',
                                    style: TextStyle(
                                      color: Colors.blue[900],
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '>',
                                    style: TextStyle(
                                      color: Colors.blue[900],
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                width: 114.0,
                                height: 45.0,
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Padding(
                                    child: Text(
                                      language
                                          ? 'Latest Visit'
                                          : 'সর্বশেষ ভিজিট',
                                    ),
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    textStyle: TextStyle(
                                      fontSize: 12.34374,
                                    ),
                                    primary: Colors.white,
                                    onPrimary: Colors.blue.shade900,
                                    shape: StadiumBorder(),
                                    side:
                                        BorderSide(color: Colors.blue.shade900),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 8),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                language ? 'Visit Date :' : 'ভিজিট তারিখ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 6),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                date,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            resX.data()!['v${i}_visit_date'] ?? '',
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 6),
                          child: Text(
                            language ? 'Progress Report' : 'প্রগ্রেস রিপোর্ট',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 6),
                          child: Text(
                            language ? visitCenter : visitCenter,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 5),
                              width: MediaQuery.of(context).size.width,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    InputTaker(
                                      title: language ? 'Height' : 'হাইট',
                                      hints: height,
                                      title1: language ? 'Weight' : 'ওয়েট',
                                      hints1: weight,
                                    ),
                                    InputTaker(
                                      title: language
                                          ? 'Blood Pressure'
                                          : 'ব্লাড প্রেশার',
                                      hints: sittingSbp + '/' + sittingDbp,
                                      title1: language ? '' : '',
                                      hints1: '',
                                    ),
                                    InputTaker(
                                      title: language ? 'FBG' : 'এফ.বি.জি',
                                      hints: fbg,
                                      title1: language
                                          ? 'S.Creatinine'
                                          : 'এস.ক্রিয়েটিনিন',
                                      hints1: sCreatinine,
                                    ),
                                    InputTaker(
                                      title: language
                                          ? '2hAG/ABF'
                                          : '২এইচ.এ.জি/এ.বি.এফ',
                                      hints: hag,
                                      title1: language
                                          ? 'Urine Albumin'
                                          : 'ইউরিন এ্যালবুমিন',
                                      hints1: urineAlbumin,
                                    ),
                                    InputTaker(
                                      title: language ? 'RBG' : 'আর.বি.জি',
                                      hints: rbg,
                                      title1: language
                                          ? 'Urine Acetone'
                                          : 'ইউরিন অ্যাসিটোন',
                                      hints1: urineAcetone,
                                    ),
                                    InputTaker(
                                      title:
                                          language ? 'HbA1c' : 'এইচ.বি.এ১.সি',
                                      hints: hba1c,
                                      title1: language ? 'USG' : 'ইউ.এস.জি',
                                      hints1: usg,
                                    ),
                                    InputTaker(
                                      title: language ? 'T.Chol' : 'টি.কোল',
                                      hints: tChol,
                                      title1: language ? 'Hb' : 'এইচ.বি',
                                      hints1: hb,
                                    ),
                                    InputTaker(
                                      title: language ? 'TG' : 'টি.জি',
                                      hints: tg,
                                      title1: language ? 'TC' : 'টি.সি',
                                      hints1: tc,
                                    ),
                                    InputTaker(
                                      title: language ? 'LDL-C' : 'এল.ডি.এল-সি',
                                      hints: ldlC,
                                      title1: language ? 'DC-N' : 'ডি.সি-এন',
                                      hints1: dcN,
                                    ),
                                    InputTaker(
                                      title:
                                          language ? 'HDL-C' : 'এইচ.ডি.এল-সি',
                                      hints: hdlC,
                                      title1: language ? 'DC-M' : 'ডি.সি-এম',
                                      hints1: dcM,
                                    ),
                                    InputTaker(
                                      title: language ? 'SGPT' : 'এস.জি.পি.টি',
                                      hints: sgpt,
                                      title1: language ? 'DC-Z' : 'ডি.সি-জেড',
                                      hints1: dcZ,
                                    ),
                                    InputTaker(
                                      title: language ? 'ECG' : 'ই.সি.জি',
                                      hints: ecg,
                                      title1: language ? 'DC-E' : 'ডি.সি-ই',
                                      hints1: dcE,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
  }
}

class InputTaker extends StatelessWidget {
  final String title;
  final String title1;

  final String hints;
  final String hints1;
  InputTaker(
      {required this.title,
      required this.hints,
      required this.title1,
      required this.hints1});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 8,
          child: Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 6,
                  ),
                  child: Text(
                    title,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            padding: EdgeInsets.only(top: 12),
            height: 42,
            child: Text(
              hints,
            ),
            // TextField(
            //   obscureText: false,
            //   decoration: InputDecoration(
            //     contentPadding: EdgeInsets.symmetric(vertical: 5),
            //     hintText: hints,
            //     border: OutlineInputBorder(),
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.white70, width: 2.0),
            //     ),
            //     labelStyle: TextStyle(color: Colors.black),
            //   ),
            // ),
          ),
        ),
        Expanded(
          flex: 9,
          child: Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                  ),
                  child: Text(
                    title1,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            height: 20,
            child:
                // TextField(
                //   obscureText: false,
                //   decoration: InputDecoration(
                //     contentPadding: EdgeInsets.symmetric(vertical: 5),
                //     hintText: hints1,
                //     border: OutlineInputBorder(),
                //     enabledBorder: OutlineInputBorder(
                //       borderSide: BorderSide(color: Colors.white70, width: 2.0),
                //     ),
                //     labelStyle: TextStyle(color: Colors.black),
                //   ),
                // ),
                Text(
              hints1,
            ),
          ),
        ),
      ],
    );
  }
}
