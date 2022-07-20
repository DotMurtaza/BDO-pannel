import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import 'Components/BDO_todays_meetings_tab.dart';
import 'Components/BDO_upcoming_meetings_tab.dart';


class BDOShowAllMeetingsScreen extends StatelessWidget {
  const BDOShowAllMeetingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
              size: 30,
            )),
        title: Text(
          "Meetings",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 0.01 * SizeConfig.screenHeight),
              Container(
                  height: 0.87 * SizeConfig.screenHeight,
                  width: 1 * SizeConfig.screenWidth,
                  child: ContainedTabBarView(
                    tabs: [
                      Text(
                        "Today's",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 0.016 * SizeConfig.screenHeight),
                      ),
                      Text(
                        "Upcoming",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 0.016 * SizeConfig.screenHeight),
                      ),
                    ],
                    tabBarProperties: TabBarProperties(
                      height: 0.06 * SizeConfig.screenHeight,
                      width: 0.97 * SizeConfig.screenWidth,
                      background: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.01 * SizeConfig.screenWidth),
                      indicator: ContainerTabIndicator(
                          height: 0.05 * SizeConfig.screenHeight,
                          color: Colors.white,
                          radius: BorderRadius.circular(50),
                          borderColor: Colors.black),
                      indicatorColor: Colors.transparent,
                      labelColor: kPrimaryColor,
                      unselectedLabelColor: Colors.black,
                    ),
                    views: [
                      BDOshowAllTodayMeetings(),
                      BDOshowAllUpcomingMeetings(),
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
