import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/apply/first_time/apply_splash.dart';
import 'package:flutter_application_1/pages/apply/first_time/for_sme/for_sme4.dart';
import 'package:flutter_application_1/pages/apply/recurring/loan_application_screen.dart';
import 'package:flutter_application_1/pages/main_views/help.dart';
import 'package:flutter_application_1/pages/main_views/pay.dart';
import 'package:flutter_application_1/pages/main_views/test.dart';
import 'package:flutter_application_1/widgets/text_h1.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'status.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var cardTextStyle = TextStyle(
      fontFamily: 'Poppins',
      letterSpacing: 1.2,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      height: 1);
  @override
  Widget build(BuildContext context) {
    // style

    return Scaffold(
      // appBar: AppBar(
      //   titleSpacing: 30,
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Color.fromRGBO(1, 67, 55, 1),
      //   title: new Text(
      //     'Home',
      //     style: TextStyle(
      //         color: Color.fromRGBO(255, 255, 255, 1),
      //         fontFamily: 'Poppins',
      //         fontSize: 25,
      //         letterSpacing: 1.2,
      //         fontWeight: FontWeight.bold,
      //         height: 1),
      //   ),
      // ),
      body: Stack(
        children: <Widget>[
          Image.asset("assets/images/home_wave_bg.png",
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              fit: BoxFit.cover),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(bottom: 1),
                  ),
                  Expanded(
                    child: Center(
                      child: GridView.count(
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        primary: false,
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: InkWell(
                                onTap: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  print(prefs.getBool("first-time"));
                                  if (prefs.getBool("first-time") != null) {
                                    if (prefs.getBool("first-time")!) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  // LoanApplicationScreen()));
                                                  // builder: (context) => ApplyForSME4()));
                                                  ApplyForSME4()));
                                    }
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                // LoanApplicationScreen()));
                                                // builder: (context) => ApplyForSME4()));
                                                ApplySplash()));
                                  }
                                },
                                child: _floatingHomeCard(
                                    'assets/images/apply.svg', 'Apply')),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              StatusScreen()));
                                },
                                child: _floatingHomeCard(
                                    'assets/images/status.svg', 'Status')),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PayScreen()));
                                },
                                child: _floatingHomeCard(
                                    'assets/images/pay.svg', 'Pay')),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HelpScreen()));
                                },
                                child: _floatingHomeCard(
                                    'assets/images/help.svg', 'Help')),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(top: 50, left: 20, child: TextH1(title: "Home"))
        ],
      ),
    );
  }

  Widget _floatingHomeCard(imageUrl, title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          imageUrl,
          height: 50,
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: cardTextStyle,
        )
      ],
    );
  }
}