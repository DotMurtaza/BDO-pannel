import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOcancelProjectReasonScreen/BDO_cancel_project_reason.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_column_info.dart';
import 'package:bdo_pannel/controllers/clientController.dart';
import 'package:bdo_pannel/models/BDO_clients_model.dart';
import 'package:bdo_pannel/models/client_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants.dart';
import 'BDO_client_detail_screen.dart';

class BDOclientInfoTiles extends StatelessWidget {
  BDOclientInfoTiles({
    Key key,
    //this.info,
    this.clientModel,
  }) : super(key: key);
  // final BDOclientModels info;
  final ClientModel clientModel;
  final clientController = Get.find<ClientController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => BDOclientDescription(
              clientModel: clientModel,
            ));
      },
      child: Container(
        margin: EdgeInsets.only(
          top: kPadding / 2,
          left: kPadding / 1.5,
          right: kPadding / 1.5,
        ),
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: kPadding, bottom: kPadding / 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: kPadding * 1.2),
                    child: Column(
                      children: [
                        ColumnInfo(
                            heading: "Client Name",
                            text: clientModel.clientName),
                      ],
                    ),
                  ),
                  Spacer(),
                  Align(
                      alignment: Alignment.centerRight,
                      child: PopupMenuButton(
                        itemBuilder: (context) => [
                          PopupMenuItem<String>(
                            child: Text("Confrim"),
                            value: "save",
                          ),
                          PopupMenuItem<String>(
                            child: Text("Cencel"),
                            value: "del",
                          ),
                        ],
                        onSelected: (value) {
                          if (value == "save") {
                            clientController
                                .changeStatustoConfirm(clientModel.id);
                            // clientController.conFirmedClient(clientModel.id);
                            Get.snackbar('Success', 'Client Save successfully');
                          } else if (value == "del") {
                            Get.to(BDOcancelProjectPage(
                              clientId: clientModel.id,
                              color: Color(0xFF96BAFF),
                            ));
                            //clientController.cancelClientReason(clientModel.id);

                          } else
                            return null;
                        },
                      ))
                  // GetX<ClientController>(
                  //     init: Get.put(ClientController()),
                  //     builder: (ClientController clientController) {
                  //       if (clientController != null &&
                  //           clientController.client != null) {
                  //         return Container(
                  //           height: 40,
                  //           width: 30,
                  //           child: ListView.builder(
                  //               itemCount: clientController.client.length,
                  //               itemBuilder: (context, index) {
                  //                 return
                  //                  ;
                  //               }),
                  //         );
                  //       } else
                  //         return Center(
                  //           child: CircularProgressIndicator(),
                  //         );
                  //     })
                ],
              ),
              ColumnInfo(
                  heading: "Client business", text: clientModel.clientBusiness),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${clientModel.time.toDate().toString()}',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontSize: 0.016 * SizeConfig.screenHeight),
                  ),
                  SizedBox(
                    width: 0.02 * SizeConfig.screenWidth,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
