import 'package:flutter/material.dart';
import 'Language.dart';

late bool language;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

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
                  'Welcome to BNDR',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue[900],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Text(
                  'বিএনডিআর এ আপনাকে স্বাগতম',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue[900],
                  ),
                ),
              ),
              Container(
                width: 137.0,
                height: 62.6,
                child: ElevatedButton(
                  onPressed: () {
                    language = true;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Language(
                          language: language,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    child: Text(
                      'English',
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                    primary: Colors.white,
                    onPrimary: Colors.blue[900],
                    shape: StadiumBorder(),
                    side: BorderSide(color: Colors.blue.shade900),
                  ),
                ),
                margin: EdgeInsets.all(30.0),
              ),
              Container(
                child: Text(
                  'or',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Container(
                width: 137.0,
                height: 62.6,
                child: ElevatedButton(
                  onPressed: () {
                    language = false;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Language(
                          language: language,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    child: Text('বাংলা'),
                    padding: EdgeInsets.all(20),
                  ),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                    primary: Colors.white,
                    onPrimary: Colors.blue[900],
                    shape: StadiumBorder(),
                    side: BorderSide(color: Colors.blue.shade900),
                  ),
                ),
                margin: EdgeInsets.all(30.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
