import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'signIn.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // ignore: unused_local_variable
    Timer _timer = new Timer(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return Home();
              } else if (snapshot.hasError) {
                return Center(child: Text("Something Went Wrong"));
              } else {
                return SignIn();
              }
            },
          );
        }),
        ModalRoute.withName("/SplashScreen"),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          alignment: Alignment.center,
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: -50,
                left: -50,
                child: Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Color(0XFFF59B794),
                    borderRadius: BorderRadius.circular(200),
                  ),
                ),
              ),
              Positioned(
                bottom: -50,
                right: -50,
                child: Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Color(0XFFF1A1C2B),
                    borderRadius: BorderRadius.circular(200),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  width: size.width,
                  height: size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/ic_launcher.png"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
