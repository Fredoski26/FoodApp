import 'dart:ui';

import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double height;
  double size;

  SmallText(
      {Key? key,
      this.color = const Color(0xff25d366),
      this.height = 1.2,
      this.size = 12,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        height: height,
      ),
    );
  }
}
