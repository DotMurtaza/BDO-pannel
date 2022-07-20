import 'dart:async';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/SiginScreen/signin_screen.dart';
import 'package:bdo_pannel/Views/BDOviews/root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../SizeConfig/size_config.dart';
import '../../../../constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Get.off(
        () => Root(),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BDO Management',
              style: Theme.of(context).textTheme.headline4.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
