import 'package:flutter/cupertino.dart';
import 'package:foodapp/utils/dimension.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  BigText(
      {Key? key,
      this.color = const Color(0xff545151),
      this.size =0,
      this.overflow = TextOverflow.ellipsis,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style:
          TextStyle(color: color, fontSize: size==0?Dimension.font20:size, fontWeight: FontWeight.w400),
    );
  }
}
