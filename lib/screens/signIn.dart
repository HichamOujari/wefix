import 'package:provider/provider.dart';
import 'package:wefix_app/services/auth/authEmail.dart';
import 'package:wefix_app/services/auth/facebook_sign_in.dart';
import 'package:wefix_app/services/auth/google_sign_in.dart';

import '/layout/background.dart';
import '/layout/inputFiealdAuth.dart';
import 'package:flutter/material.dart';

import 'signup.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = "Email";
  String password = "Password";
  TextEditingController emailInput = new TextEditingController();
  TextEditingController passInput = new TextEditingController();

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
                    InputFieldAuth(
                      title: email,
                      icon: SizedBox(),
                      typeKey: TextInputType.emailAddress,
                      controller: emailInput,
                    ),
                    SizedBox(height: 20),
                    InputFieldAuth(
                      title: password,
                      icon: iconPass,
                      typeKey: TextInputType.text,
                      controller: passInput,
                    ),
                    SizedBox(height: 40),
                    GestureDetector(
                      onTap: () async {
                        var emailValue = emailInput.text;
                        var passValue = passInput.text;
                        final snackBar = SnackBar(
                          content: Text("Check your information"),
                          action: SnackBarAction(
                            label: 'Ok!',
                            onPressed: () {},
                          ),
                        );
                        if (passValue.length < 8 || emailValue.length == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          var rslt =
                              await EmailAuth().signIn(emailValue, passValue);
                          if (rslt == false) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      },
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
                              onTap: () {
                                /*final snackBar = SnackBar(
                                  content: Text("Check your information"),
                                  action: SnackBarAction(
                                    label: 'Ok!',
                                    onPressed: () {},
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);*/
                              },
                              child: Icon(Icons.facebook,
                                  size: 50, color: Colors.blue.shade800),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                final provider =
                                    Provider.of<GoogleSignInProvider>(context,
                                        listen: false);
                                provider.googleLogin();
                              },
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
                              " You havn???t  account ?  ",
                              style: TextStyle(fontSize: 17),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return SignUp();
                                    },
                                  ),
                                );
                              },
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
