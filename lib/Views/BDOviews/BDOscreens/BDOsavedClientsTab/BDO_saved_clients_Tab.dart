import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOconfirmedProjectsScreen/Components/BDO_confirmed_projects_description_tile.dart';
import 'package:bdo_pannel/controllers/confirmed_Clinets_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BDOsavedClientsTab extends StatelessWidget {
  const BDOsavedClientsTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: SizeConfig.screenHeight * 0.81,
            width: SizeConfig.screenWidth,
            child: GetX<ConfirmClientsController>(
                init: Get.put(ConfirmClientsController()),
                builder: (ConfirmClientsController confirmClientsController) {
                  if (confirmClientsController != null &&
                      confirmClientsController.confirmClient != null) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListView.builder(
                          itemCount:
                              confirmClientsController.confirmClient.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: BDOconfirmedProjectDescriptionContainer(
                                //  confirm: confirmed[0],
                                confirmClientModel: confirmClientsController
                                    .confirmClient[index],
                              ),
                            );
                          }),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
