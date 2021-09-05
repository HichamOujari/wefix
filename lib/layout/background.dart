import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 20,
          right: -60,
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              color: Color(0XFFF59B794),
              borderRadius: BorderRadius.circular(200),
            ),
          ),
        ),
        Positioned(
          top: -60,
          right: -7,
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              color: Color.fromRGBO(12, 19, 36, 48),
              borderRadius: BorderRadius.circular(200),
            ),
          ),
        ),
        child
      ],
    );
  }
}
