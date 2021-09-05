import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.red,
      ),
    );
  }
}
