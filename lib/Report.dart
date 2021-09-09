import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'ActualLogin.dart';
import 'Profile.dart';
import 'Doctors.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  ScrollController _controller = ScrollController(initialScrollOffset: 300.0);
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
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
                  onTap: () {},
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
                  onTap: () {},
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
                        builder: (context) => Doctors(),
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
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.corporate_fare,
                    color: Colors.white,
                  ),
                  title: Text(
                    language ? 'BADAS Center' : 'বাডাস কেন্দ্র',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    language ? 'Logout' : 'প্রস্থান',
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
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _controller,
          child: ListView.builder(
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
                            language ? 'Logout' : 'প্রস্থান',
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
                                language ? 'Good morning' : 'সুপ্রভাত',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                language ? 'Farook Azam Khan' : 'ফারুক আজম খান',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                              'https://googleflutter.com/sample_image.jpg',
                            ),
                            backgroundColor: Colors.transparent,
                          ),
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
                                      : 'সর্বশেষ পরিদর্শন',
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
                                side: BorderSide(color: Colors.blue.shade900),
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
                            '08 Aug, 2021',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Text('08, August, 2021'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Progress Report',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Text('BIRDEM General Hospital'),
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
                                  title: 'Height',
                                  hints: '5 feet 8 inch',
                                  title1: 'Weight',
                                  hints1: '78kg',
                                ),
                                InputTaker(
                                  title: 'Sitting SBP',
                                  hints: '120',
                                  title1: 'Sitting DBP',
                                  hints1: '80',
                                ),
                                InputTaker(
                                  title: 'FBG',
                                  hints: '7.0',
                                  title1: 'S.Creatinine',
                                  hints1: '0.98',
                                ),
                                InputTaker(
                                  title: '2hAG',
                                  hints: '8.2',
                                  title1: 'SGPT',
                                  hints1: '20 U/L',
                                ),
                                InputTaker(
                                  title: 'RBG',
                                  hints: '8.4',
                                  title1: 'Urine Albumin',
                                  hints1: '',
                                ),
                                InputTaker(
                                  title: 'HbA1c',
                                  hints: '6.9%',
                                  title1: 'Urine Acetone',
                                  hints1: '',
                                ),
                                InputTaker(
                                  title: 'T.Chol',
                                  hints: '156',
                                  title1: 'TG',
                                  hints1: '121',
                                ),
                                InputTaker(
                                  title: 'LDL-C',
                                  hints: '101',
                                  title1: 'HDL-C',
                                  hints1: '31',
                                ),
                                InputTaker(
                                  title: 'USG',
                                  hints: '',
                                  title1: 'ECG',
                                  hints1: '',
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 8,
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 8,
                                                ),
                                                child: Text(
                                                  'CBC',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 25,
                                        child: Container(
                                          alignment: Alignment.bottomLeft,
                                          padding: EdgeInsets.only(right: 168),
                                          height: 25,
                                          child: TextField(
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 5),
                                              hintText: '',
                                              border: OutlineInputBorder(),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white70,
                                                    width: 2.0),
                                              ),
                                              labelStyle: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
                    left: 8,
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
          flex: 10,
          child: Container(
            height: 25,
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                hintText: hints,
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: 2.0),
                ),
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 9,
          child: Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
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
            height: 25,
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                hintText: hints1,
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: 2.0),
                ),
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
