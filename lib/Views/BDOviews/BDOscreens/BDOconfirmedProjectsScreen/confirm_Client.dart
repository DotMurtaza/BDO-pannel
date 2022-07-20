import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOconfirmedProjectsScreen/Components/cancel_tab_widget.dart';
import 'package:bdo_pannel/controllers/confirmed_Clinets_Controller.dart';
import 'package:bdo_pannel/models/BDO_all_projects_models.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import 'Components/BDO_confirmed_projects_description_tile.dart';

class ConfirmClients extends StatelessWidget {
  const ConfirmClients({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF50CB93),
        title: Text(
          "Confirmed Client",
        ),
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(
                  top: kPadding / 2, left: kPadding, right: kPadding),
              child: Container(
                  height: 0.8 * SizeConfig.screenHeight,
                  width: 1 * SizeConfig.screenWidth,
                  child: ContainedTabBarView(
                    tabs: [
                      Text(
                        "Confirm Clients",
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
                        "Cancel Client",
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
                      ConfirmClientTabWidget(),
                      //BDOallNotUpdatedMeetingsTab(),
                      CancelTab(),
                    ],
                  ))
              //
              )),
    );
  }
}

class ConfirmClientTabWidget extends StatelessWidget {
  const ConfirmClientTabWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: SizeConfig.heightMultiplier * 74,
          width: SizeConfig.screenWidth,
          child: GetX<ConfirmClientsController>(
              init: Get.put(ConfirmClientsController()),
              builder: (ConfirmClientsController confirmClientsController) {
                if (confirmClientsController != null &&
                    confirmClientsController.confirmClient != null) {
                  return ListView.builder(
                      itemCount: confirmClientsController.confirmClient.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: BDOconfirmedProjectDescriptionContainer(
                            confirm: confirmed[0],

                            confirmClientModel:
                                confirmClientsController.confirmClient[index],
                            // confirmClientsController:
                            //     confirmClientsController,
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: Text("No client Confirmed yet"),
                  );
                }
              }),
        )
      ],
    );
  }
}
