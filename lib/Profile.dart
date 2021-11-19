import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'HomePage.dart';
import 'ActualLogin.dart';
import 'Report.dart';
import 'under.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool language = true;
  getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getBool('language')!;
    setState(
      () {},
    );
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

  TextEditingController birth = TextEditingController();
  TextEditingController married = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController nid = TextEditingController();
  TextEditingController gen = TextEditingController();
  TextEditingController div = TextEditingController();
  TextEditingController dis = TextEditingController();
  TextEditingController up = TextEditingController();
  TextEditingController add = TextEditingController();
  TextEditingController pos = TextEditingController();
  TextEditingController ex = TextEditingController();
  TextEditingController prof = TextEditingController();
  TextEditingController edu = TextEditingController();

  var basicInfo, mainInfo;
  var resX, i, name = '';

  void getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var y = preferences.getString('patientid_firebase');
    var p = await FirebaseFirestore.instance
        .collection('s nagar 2')
        .doc(y)
        .collection('visits')
        .doc('basicinfo')
        .get();
    var z =
        await FirebaseFirestore.instance.collection('s nagar 2').doc(y).get();
    setState(
      () {
        basicInfo = p;
        mainInfo = z;
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onPressed: () {},
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
      backgroundColor: Color(0xffF5F5F9),
      body: SafeArea(
          child: mainInfo == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.only(left: 4.5, right: 0, bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 119.0,
                                    height: 53.6,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Report(),
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        child: Text(
                                          language ? 'Cancel' : 'বাতিল',
                                        ),
                                        padding: EdgeInsets.all(10),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        textStyle: TextStyle(
                                          fontSize: 15,
                                        ),
                                        primary: Colors.blue[900],
                                        onPrimary: Colors.white,
                                        shape: StadiumBorder(),
                                        side: BorderSide(color: Colors.black38),
                                      ),
                                    ),
                                    margin: EdgeInsets.all(12.0),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    width: 113.0,
                                    height: 57.6,
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
                                        child:
                                            Text(language ? 'Logout' : 'লগআউট'),
                                        padding: EdgeInsets.only(right: 0),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        textStyle: TextStyle(
                                          fontSize: 15,
                                        ),
                                        primary: Colors.blue[900],
                                        onPrimary: Colors.white,
                                        shape: StadiumBorder(),
                                        side: BorderSide(
                                            color: Colors.blue.shade900),
                                      ),
                                    ),
                                    margin: EdgeInsets.only(left: 80),
                                  ),
                                ],
                              ),
                              Text(
                                language
                                    ? 'BASIC INFORMATION'
                                    : 'ব্যক্তিগত তথ্য',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTaker(
                                editable: false,
                                takeIcon: false,
                                title: language ? 'Full Name' : 'নাম',
                                hints: basicInfo.data()['patient_name'],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTaker(
                                title: language ? 'Phone Number' : 'ফোন নম্বর',
                                hints: mainInfo.data()['patient_phone'],
                                editable: false,
                                takeIcon: false,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTaker(
                                editable: false,
                                takeIcon: false,
                                title: language ? 'Email' : 'ইমেইল',
                                hints: mainInfo.data()['patient_email'] ?? '',
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTaker(
                                editable: false,
                                takeIcon: false,
                                title: language ? 'Center ID' : 'সেন্টার আইডি',
                                hints: basicInfo.data()['patient_idby_center'],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTakerXc(
                                phnx: married,
                                title: language
                                    ? 'Marital Status'
                                    : 'বৈবাহিক অবস্থা',
                                hints:
                                    basicInfo.data()['patient_marital_status'],
                                ft: 'patient_marital_status',
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTaker(
                                editable: false,
                                takeIcon: false,
                                title:
                                    language ? 'Organization' : 'অরগানাইজেশন',
                                hints: basicInfo.data()['org_name'],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTaker(
                                editable: false,
                                takeIcon: false,
                                title: language
                                    ? 'Registration Center'
                                    : 'নিবন্ধন সেন্টার',
                                hints: basicInfo.data()['center_name'],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTaker(
                                editable: false,
                                takeIcon: false,
                                title: language
                                    ? 'Registration Date'
                                    : 'নিবন্ধনের তারিখ',
                                hints: basicInfo.data()['patient_create_date'],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTakerXc(
                                phnx: birth,
                                title:
                                    language ? 'Date Of Birth' : 'জন্ম তারিখ',
                                hints: basicInfo.data()['patient_dateof_birth'],
                                ft: 'patient_dateof_birth',
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTakerXc(
                                phnx: age,
                                title: language ? 'Age' : 'বয়স',
                                hints: basicInfo.data()['patient_age'],
                                ft: 'patient_age',
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTakerXc(
                                phnx: nid,
                                title: language
                                    ? 'National ID'
                                    : 'জাতীয় পরিচয়পত্র',
                                hints: basicInfo.data()['patient_nid'],
                                ft: 'patient_nid',
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTakerXc(
                                phnx: gen,
                                title: language ? 'Gender' : 'লিঙ্গ',
                                hints: basicInfo.data()['patient_gender'],
                                ft: 'patient_gender',
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTaker(
                                editable: false,
                                takeIcon: false,
                                title: language
                                    ? 'Patient Guide Book No.'
                                    : 'গাইড বই নং',
                                hints:
                                    mainInfo.data()['patient_guide_book_no'] ??
                                        '',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: Text(
                                  language ? 'ADDRESS' : 'ঠিকানা',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTakerXc(
                                phnx: div,
                                title: language ? 'Division' : 'বিভাগ',
                                hints: basicInfo.data()['division_name'],
                                ft: 'division_name',
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTakerXc(
                                phnx: dis,
                                title: language ? 'District' : 'জেলা',
                                hints: basicInfo.data()['district_name'],
                                ft: 'district_name',
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTakerXc(
                                phnx: up,
                                title: language ? 'Upazila' : 'উপজেলা',
                                hints: basicInfo.data()['upazila_name'],
                                ft: 'upazila_name',
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTakerXc(
                                phnx: add,
                                title: language ? 'Address' : 'ঠিকানা',
                                hints: basicInfo.data()['patient_address'],
                                ft: 'patient_address',
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              InputTakerXc(
                                phnx: pos,
                                title: language ? 'Postal Code' : 'পোস্ট কোড',
                                hints: basicInfo.data()['patient_postal_code'],
                                ft: 'patient_postal_code',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: Text(
                                  language
                                      ? 'PROFESSIONAL INFORMATION'
                                      : 'পেশাগত তথ্য',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTakerXc(
                                phnx: ex,
                                title: language
                                    ? 'Monthly Expenditure'
                                    : 'মাসিক ব্যয়',
                                hints: basicInfo.data()['monthly_expenditure'],
                                ft: 'monthly_expenditure',
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTakerXc(
                                phnx: prof,
                                title: language ? 'Profession' : 'পেশা',
                                hints: basicInfo.data()['profession'],
                                ft: 'profession',
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InputTakerXc(
                                phnx: edu,
                                title:
                                    language ? 'Education' : 'শিক্ষাগত যোগ্যতা',
                                hints: basicInfo.data()['education'],
                                ft: 'education',
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
    );
  }
}

class InputTaker extends StatelessWidget {
  final String title;
  final bool takeIcon;
  final String hints;
  final bool editable;

  InputTaker({
    required this.title,
    required this.takeIcon,
    required this.hints,
    required this.editable,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                ),
                takeIcon
                    ? Padding(
                        padding: const EdgeInsets.only(),
                        child: Icon(Icons.mode),
                      )
                    : SizedBox(),
              ],
            ),
          ),
          Expanded(
            flex: 1,
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
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: hints,
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white70, width: 2.0),
                      ),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class InputTakerXc extends StatefulWidget {
  final String title;
  final String ft;
  final String hints;

  TextEditingController phnx;
  InputTakerXc(
      {required this.title,
      required this.ft,
      required this.hints,
      required this.phnx});

  @override
  _InputTakerXcState createState() => _InputTakerXcState();
}

class _InputTakerXcState extends State<InputTakerXc> {
  bool isEditig = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              widget.title,
            ),
          ),
          Expanded(
            flex: 1,
            child: TextFormField(
              controller: widget.phnx,
              obscureText: false,
              onChanged: (v) {
                setState(() {
                  isEditig = true;
                });
              },
              decoration: InputDecoration(
                  hintText: widget.hints,
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70, width: 2.0),
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                  suffixIcon: GestureDetector(
                    onTap: () async {
                      final firestoreInstance = FirebaseFirestore.instance;
                      print(widget.phnx.text);
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      var y = preferences.getString('patientid_firebase');
                      try {
                        firestoreInstance
                            .collection('s nagar 2')
                            .doc(y)
                            .collection('visits')
                            .doc('basicinfo')
                            .set({widget.ft: widget.phnx.text},
                                SetOptions(merge: true)).then((_) {
                          print("success!");
                          Get.off(Profile());
                          Get.snackbar(
                              '',
                              language
                                  ? 'Successfully saved'
                                  : 'সফলভাবে সংরক্ষিত');
                        });
                      } catch (e) {
                        Get.off(Profile());
                        Get.snackbar(
                            language ? '' : '',
                            language
                                ? 'Something went wrong'
                                : 'কিছু ভুল হয়েছে');
                      }
                    },
                    child: Icon(isEditig == false ? Icons.edit : Icons.save),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
