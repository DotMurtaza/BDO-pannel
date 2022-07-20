import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOAllclientsTab/BDO_clients_Tab.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOsavedClientsTab/BDO_saved_clients_Tab.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class BDOclientsScreen extends StatelessWidget {
  const BDOclientsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Text("All Clients"),
        centerTitle: true,
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
                        "All Clients",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 0.016 * SizeConfig.screenHeight),
                      ),
                      Text(
                        "Confirm",
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
                      BDOclientsTab(),
                      BDOsavedClientsTab(),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
