import '/layout/background.dart';
import '/layout/inputFiealdAuth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String phone = "Phone number";
  String password = "Password";
  Icon iconPass = Icon(Icons.visibility, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          child: Background(
            child: Container(
              width: size.width,
              height: size.height,
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 60),
                    InputFieldAuth(title: phone, icon: SizedBox()),
                    SizedBox(height: 20),
                    InputFieldAuth(title: password, icon: iconPass),
                    SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: size.width * 0.6,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Color(0XFFF59B794), width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Color(0XFFF59B794),
                          ),
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: size.width * 0.8,
                      child: Text(
                        "Forget password",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue, fontSize: 17),
                      ),
                    ),
                    Container(
                      width: size.width * 0.3,
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.black,
                              thickness: 2,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Or",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.black,
                              thickness: 2,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: size.width * 0.3,
                      margin: EdgeInsets.only(top: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Icon(Icons.facebook,
                                  size: 50, color: Colors.blue.shade800),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.red.shade800),
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: Icon(Icons.g_mobiledata,
                                    size: 45, color: Colors.red.shade800),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.3,
                      margin: EdgeInsets.only(bottom: 20, top: 10),
                      child: Divider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                    ),
                    Container(
                      width: size.width,
                      alignment: Alignment.center,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              " You havn’t  account ?  ",
                              style: TextStyle(fontSize: 17),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0XFFF59B794),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
