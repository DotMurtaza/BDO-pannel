import 'package:bdo_pannel/Views/BDOviews/BDOscreens/SiginScreen/signin_screen.dart';
import 'package:bdo_pannel/controllers/userController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'BDOscreens/BDObottomNavBar/BDO_bottom_nav_bar.dart';

class Root extends StatelessWidget {
  const Root({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<UserController>(
      initState: (_) {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<UserController>().users != null) {
          return BDObottomNaveBar();
        } else
          return SigninScreen();
      },
    );
  }
}
