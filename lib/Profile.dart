import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'LoginScreen.dart';
import 'ActualLogin.dart';
import 'Report.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                  onTap: () {},
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
      backgroundColor: Color(0xffF5F5F9),
      body: SafeArea(
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _controller,
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, i) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 4.5, right: 0, bottom: 10),
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
                                        builder: (context) => LoginScreen(
                                          type: '',
                                          userId: '',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    child: Text(language
                                        ? 'Update Password'
                                        : 'পাসওয়ার্ড আপডেট'),
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
                              Padding(
                                padding: EdgeInsets.zero,
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: NetworkImage(
                                    'https://googleflutter.com/sample_image.jpg',
                                  ),
                                  backgroundColor: Colors.transparent,
                                ),
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
                                        Text(language ? 'Logout' : 'প্রস্থান'),
                                    padding: EdgeInsets.only(right: 0),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    textStyle: TextStyle(
                                      fontSize: 15,
                                    ),
                                    primary: Colors.blue[900],
                                    onPrimary: Colors.white,
                                    shape: StadiumBorder(),
                                    side:
                                        BorderSide(color: Colors.blue.shade900),
                                  ),
                                ),
                                margin: EdgeInsets.only(right: 2),
                              ),
                            ],
                          ),
                          Container(
                            child: Text(
                              language ? 'BASIC INFORMATION' : 'মৌলিক তথ্য',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InputTaker(
                            takeIcon: false,
                            title: language ? 'Full Name' : 'পুরো নাম',
                            hints:
                                language ? 'Farook Azam Khan' : 'ফারুক আজম খান',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InputTaker(
                            takeIcon: true,
                            title: language ? 'Phone Number' : 'ফোন নম্বর',
                            hints: '01916851203',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InputTaker(
                            takeIcon: true,
                            title: language ? 'Email' : 'ইমেইল',
                            hints: 'farookazam@gmail.com',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InputTaker(
                            takeIcon: false,
                            title: language
                                ? 'Previous Center ID'
                                : 'পূর্ববর্তী সেন্টার আইডি',
                            hints: 'MP00001/17',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InputTaker(
                            takeIcon: true,
                            title:
                                language ? 'Marital Status' : 'বৈবাহিক অবস্থা',
                            hints: language ? 'Married' : 'বিবাহিত',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InputTaker(
                            takeIcon: false,
                            title: language ? 'Organization' : 'সংগঠন',
                            hints: language ? 'BIRDEM' : 'বারডেম',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InputTaker(
                            takeIcon: false,
                            title: language ? 'Center' : 'কেন্দ্র',
                            hints: language ? 'BIRDEM-1' : 'বারডেম -1',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InputTaker(
                            takeIcon: false,
                            title: language
                                ? 'Registration Date'
                                : 'নিবন্ধনের তারিখ',
                            hints: language ? '23-06-2021' : '০৮-০৮-২০২১',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InputTaker(
                            takeIcon: true,
                            title: 'Date Of Birth',
                            hints: language ? '17-05-1981' : '১৭-০৫-১৯৮১',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InputTaker(
                            takeIcon: true,
                            title: language ? 'Age' : 'বয়স',
                            hints: language ? '40' : '৪০',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InputTaker(
                            takeIcon: true,
                            title:
                                language ? 'National ID' : 'জাতীয় পরিচয়পত্র',
                            hints: '1122334455667',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InputTaker(
                            takeIcon: true,
                            title: language ? 'Gender' : 'লিঙ্গ',
                            hints: language ? 'Male' : 'পুরুষ',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InputTaker(
                            takeIcon: false,
                            title: language
                                ? 'Patient Guide Book No.'
                                : 'রোগী গাইড বই নং',
                            hints: '717',
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
                          InputTaker(
                            takeIcon: true,
                            title: language ? 'Division' : 'বিভাগ',
                            hints: language ? 'Dhaka' : 'ঢাকা',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InputTaker(
                            takeIcon: true,
                            title: language ? 'District' : 'জেলা',
                            hints: language ? 'Dhaka' : 'ঢাকা',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InputTaker(
                            takeIcon: true,
                            title: language ? 'Upazila' : 'উপজেলা',
                            hints: language
                                ? 'Select Upazila'
                                : 'উপজেলা নির্বাচন করুন',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InputTaker(
                            takeIcon: true,
                            title: language ? 'Address' : 'ঠিকানা',
                            hints: language
                                ? '125,1 Darus Salam Road, Mirpur'
                                : '১২৫,১ দারুসসালাম রোড, মিরপুর',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InputTaker(
                            takeIcon: true,
                            title: language
                                ? 'Postal Code'
                                : 'পোস্ট অফিসের নাম্বার',
                            hints: language ? '1216' : '১২১৬',
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
                          InputTaker(
                            takeIcon: true,
                            title: language
                                ? 'Monthly Expenditure'
                                : 'মাসিক ব্যয়',
                            hints: language ? '20000-<30000' : '২০০০০-<৩০০০০',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InputTaker(
                            takeIcon: true,
                            title: language ? 'Profession' : 'পেশা',
                            hints: language ? 'Employed' : 'চাকুরিজীবী',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InputTaker(
                            takeIcon: true,
                            title: language ? 'Education' : 'শিক্ষা',
                            hints: language ? '>16 years' : '>১৬ বছর',
                          ),
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
                                    child: Text(language ? 'Cancel' : 'বাতিল'),
                                    padding: EdgeInsets.all(10),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    textStyle: TextStyle(
                                      fontSize: 15,
                                    ),
                                    primary: Colors.white,
                                    onPrimary: Colors.black,
                                    shape: StadiumBorder(),
                                    side: BorderSide(color: Colors.black38),
                                  ),
                                ),
                                margin: EdgeInsets.all(12.0),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 122.0,
                                height: 57.6,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Padding(
                                    child: Text(language ? 'Save' : 'সংরক্ষণ'),
                                    padding: EdgeInsets.all(20),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    textStyle: TextStyle(
                                      fontSize: 15,
                                    ),
                                    primary: Colors.blue[900],
                                    onPrimary: Colors.white,
                                    shape: StadiumBorder(),
                                    side:
                                        BorderSide(color: Colors.blue.shade900),
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
                ],
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
  final bool takeIcon;
  final String hints;
  InputTaker(
      {required this.title, required this.takeIcon, required this.hints});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        Expanded(
          flex: 6,
          child: Container(
            height: 40,
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
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
      ],
    );
  }
}
