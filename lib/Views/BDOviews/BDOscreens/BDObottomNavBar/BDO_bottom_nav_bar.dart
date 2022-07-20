import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOallMeetingsScreen/BDO_meeting_screen.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOclientsScreen/BDO_clients_screen.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOmainHomeScreen/BDO_home_screen.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOprofileScreen/BDO_profile_screen.dart';
import 'package:bdo_pannel/controllers/BDO_main_controller.dart';
import 'package:bdo_pannel/controllers/userController.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../constants.dart';

class BDObottomNaveBar extends StatefulWidget {
  const BDObottomNaveBar({Key key}) : super(key: key);

  @override
  _BDObottomNaveBarState createState() => _BDObottomNaveBarState();
}

class _BDObottomNaveBarState extends State<BDObottomNaveBar> {
  final userController = Get.put(UserController());
  int _currentIndex = 0;
  List classes = [
    BDOhomeScreen(),
    BDOmeetingsScreen(),
    BDOclientsScreen(),
    BDOprofileScreen(),
  ];
  @override
  void initState() {
    userController.getUser();
    super.initState();
    Get.put(BDOmainController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: classes[_currentIndex],
        bottomNavigationBar: BottomNavyBar(
          containerHeight: 0.07 * SizeConfig.screenHeight,
          backgroundColor: Colors.white,
          showElevation: false,
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
                activeColor: kPrimaryColor,
                inactiveColor: Colors.grey),
            BottomNavyBarItem(
                icon: Icon(MdiIcons.calendarClock),
                title: Text("Meetings"),
                activeColor: kPrimaryColor,
                inactiveColor: Colors.grey),
            BottomNavyBarItem(
                icon: Icon(FontAwesomeIcons.userFriends),
                title: Text("  Clients"),
                activeColor: kPrimaryColor,
                inactiveColor: Colors.grey),
            BottomNavyBarItem(
                icon: Icon(Icons.person),
                title: Text("Profile"),
                activeColor: kPrimaryColor,
                inactiveColor: Colors.grey),
          ],
        ));
  }
}
