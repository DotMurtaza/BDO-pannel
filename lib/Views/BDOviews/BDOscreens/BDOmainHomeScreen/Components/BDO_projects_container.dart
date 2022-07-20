import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';

class BDOprojectsContainer extends StatelessWidget {
  const BDOprojectsContainer({
    Key key,
    this.image,
    this.title,
    this.amount,
    this.numprojects,
    this.color,
    this.isamount,
    this.press,
  }) : super(key: key);
  final String image, title;
  final int amount;
  final int numprojects;
  final Color color;
  final bool isamount;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 0.13 * SizeConfig.screenHeight,
        width: 0.43 * SizeConfig.screenWidth,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 0.01 * SizeConfig.screenHeight),
            SizedBox(
              height: 0.04 * SizeConfig.screenHeight,
              width: 0.15 * SizeConfig.screenWidth,
              child: Image.asset(image),
            ),
            Text(
              title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            isamount
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 0.03 * SizeConfig.screenWidth),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: kHardTextColor,
                            ))
                      ],
                    ),
                  )
                : Text("$numprojects Clients",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kHardTextColor,
                    )),
            SizedBox(height: 0.01 * SizeConfig.screenHeight),
          ],
        ),
      ),
    );
  }
}
