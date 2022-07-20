import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOallMeetingsScreenTab/BDO_all_meetings_tab.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOallNotUpdatedMeetingsTab/BDO_all_not_updated__meetings_tab.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOallUpComingMeetingsTab/BDO_all_up_coming__meetings_tab.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class BDOmeetingsScreen extends StatelessWidget {
  const BDOmeetingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        backgroundColor: kPrimaryColor,
        title: Text("Meetings"),
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 0.01 * SizeConfig.screenHeight),
              Container(
                  height: 0.8 * SizeConfig.screenHeight,
                  width: 1 * SizeConfig.screenWidth,
                  child: ContainedTabBarView(
                    tabs: [
                      Text(
                        "All Meetings",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 0.016 * SizeConfig.screenHeight),
                      ),
                      // Text(
                      //   "Not Updated",
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.w600,
                      //       fontSize: 0.016 * SizeConfig.screenHeight),
                      // ),
                      Text(
                        "Upcoming",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 0.016 * SizeConfig.screenHeight),
                      )
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
                      BDOallMeetingsTab(),
                      //BDOallNotUpdatedMeetingsTab(),
                      BDOallUpComingMeetingsTab(),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
