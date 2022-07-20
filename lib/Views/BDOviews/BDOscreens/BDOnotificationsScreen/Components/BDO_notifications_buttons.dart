import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:flutter/material.dart';

class BDOacceptDeclineButton extends StatelessWidget {
  const BDOacceptDeclineButton({
    Key key,
    this.title,
    this.color,
    this.titlecolor,
  }) : super(key: key);
  final String title;
  final Color color;
  final Color titlecolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.04 * SizeConfig.screenHeight,
      width: 0.3 * SizeConfig.screenWidth,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: titlecolor),
        ),
      ),
    );
  }
}
