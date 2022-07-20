
import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOnotConfirmedMeetingTab/BDO_not_confirmed_meeting_tab.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOnotConfirmedNotUpdateTab/BDO_not_confirmed_not_updated_tab.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOnotConfirmedUpComingTab/BDO_not_confirmed_up_coming_tab.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';

class BDOnotConfirmedMeetingsScreen extends StatelessWidget {
  const BDOnotConfirmedMeetingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF96BAFF),
        title: Text("Not Confirmed"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 0.01 * SizeConfig.screenHeight),
              Container(
                  height: 0.87 * SizeConfig.screenHeight,
                  width: 1 * SizeConfig.screenWidth,
                  child: ContainedTabBarView(
                    tabs: [
                      Text(
                        "Meetings",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 0.016 * SizeConfig.screenHeight),
                      ),
                      Text(
                        "Not Updated",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 0.016 * SizeConfig.screenHeight),
                      ),
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
                      labelColor: Color(0xFF96BAFF),
                      unselectedLabelColor: Colors.black,
                    ),
                    views: [
                      BDOnotConfirmedMeetingsTab(),
                      BDOnotConfirmedNotUpdatedTab(),
                      BDOnotConfirmedUpComingTab(),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
