import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOaddNewProjectScreen/Add_new_client_screen.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOcancelProjectReasonScreen/BDO_cancel_project_reason.dart';
import 'package:bdo_pannel/controllers/BDO_main_controller.dart';
import 'package:bdo_pannel/controllers/auth_controller.dart';
import 'package:bdo_pannel/controllers/clientController.dart';
import 'package:bdo_pannel/models/BDO_all_projects_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';
import 'Components/BDO_confirm_project_screen.dart';
import 'Components/BDO_not_confirmed_description_tile.dart';

class MyClients extends StatefulWidget {
  const MyClients({Key key}) : super(key: key);

  @override
  _BDOnotConfirmedScreenState createState() => _BDOnotConfirmedScreenState();
}

class _BDOnotConfirmedScreenState extends State<MyClients> {
  @override
  void initState() {
    Get.put(BDOmainController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF96BAFF),
        title: Text(
          "My Clients",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: kPadding / 2),
          child: Column(
            children: [
              GetX<ClientController>(
                  init: Get.put(ClientController()),
                  builder: (ClientController clientController) {
                    if (clientController != null &&
                        clientController.client != null) {
                      return Container(
                        height: SizeConfig.heightMultiplier * 80,
                        width: SizeConfig.screenWidth,
                        child: ListView.builder(
                            itemCount: clientController.client.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              print(
                                  "Client name is ${clientController.client[index].clientName}");

                              return Slidable(
                                actionPane: SlidableDrawerActionPane(),
                                secondaryActions: [
                                  IconSlideAction(
                                    caption: "Confirm",
                                    color: Color(0xFF50CB93),
                                    icon: Icons.check,
                                    onTap: () {
                                      clientController.changeStatustoConfirm(
                                          clientController.client[index].id);
                                      // clientController.conFirmedClient(
                                      //     clientController.client[index].id);
                                      // Get.to(BDOconfirmProjectPage());
                                    },
                                  ),
                                  IconSlideAction(
                                    caption: "Cancel",
                                    color: Color(0xFFFF6767),
                                    icon: Icons.cancel_presentation_sharp,
                                    onTap: () {
                                      Get.to(BDOcancelProjectPage(
                                        clientId:
                                            clientController.client[index].id,
                                        color: Color(0xFF96BAFF),
                                      ));
                                      // clientController.deleteClient(
                                      //     clientController.client[index].id);
                                      // // Get.to(BDOcancelProjectPage(
                                      // //   color: Color(0xFF96BAFF),
                                      // // ));
                                    },
                                  ),
                                ],
                                child: ListTile(
                                  title: MyClientInformationContainer(
                                    //notConfirm: notConfirmed[index],
                                    clientModel: clientController.client[index],
                                  ),
                                ),
                              );
                            }),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddnewClientScreen());
        },
        backgroundColor: Color(0xFF96BAFF),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
