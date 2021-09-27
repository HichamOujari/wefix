import 'package:provider/provider.dart';
import 'package:wefix_app/services/auth/authEmail.dart';
import 'package:wefix_app/services/auth/google_sign_in.dart';

import '/layout/background.dart';
import '/layout/inputFiealdAuth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "Email";
  String password = "Password";
  Icon iconPass = Icon(Icons.visibility, color: Colors.black);
  TextEditingController emailInput = new TextEditingController();
  TextEditingController passInput = new TextEditingController();
  TextEditingController confirmPassInput = new TextEditingController();

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
                      "Sign Up",
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
                    SizedBox(height: 20),
                    InputFieldAuth(
                      title: "Confirm " + password,
                      icon: iconPass,
                      typeKey: TextInputType.text,
                      controller: confirmPassInput,
                    ),
                    SizedBox(height: 40),
                    GestureDetector(
                      onTap: () async {
                        var emailValue = emailInput.text;
                        var passValue = passInput.text;
                        var conPass = confirmPassInput.text;

                        if (passValue != conPass ||
                            passValue.length < 8 ||
                            emailValue.length == 0) {
                          final snackBar = SnackBar(
                            content: Text(
                                "The passwords must be identique & longer then 7 character"),
                            action: SnackBarAction(
                              label: 'Ok!',
                              onPressed: () {},
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          var rslt =
                              await EmailAuth().signUp(emailValue, passValue);
                          if (rslt == false) {
                            final snackBar = SnackBar(
                              content: Text("Email already exist"),
                              action: SnackBarAction(
                                label: 'Ok!',
                                onPressed: () {},
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            Navigator.pop(context);
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
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Color(0XFFF59B794),
                          ),
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                    SizedBox(height: 30),
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
                              " You already have an account ?  ",
                              style: TextStyle(fontSize: 17),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Sign In",
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
