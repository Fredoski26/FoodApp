import 'package:foodapp/utils/dimension.dart';
import 'package:flutter/cupertino.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backGround;
  final Color iconColor;
  final double iconSize;
  final double size;

  AppIcon(
      {Key? key,
      required this.icon,
      this.backGround = const Color(0xFFfcf4e4),
      this.iconColor = const Color(0xff949292),
      this.size = 45, this.iconSize=16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2), color: backGround),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
