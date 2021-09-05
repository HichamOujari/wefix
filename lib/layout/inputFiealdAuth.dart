import 'package:flutter/material.dart';

class InputFieldAuth extends StatelessWidget {
  const InputFieldAuth({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.75,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(2, 3),
            blurRadius: 4,
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          hintText: title,
          hintStyle: TextStyle(
            fontSize: 18,
          ),
          suffixIcon: icon,
        ),
      ),
    );
  }
}
