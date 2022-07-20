import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/controllers/confirmed_Clinets_Controller.dart';
import 'package:bdo_pannel/models/confirm_client_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../../../../../constants.dart';
import 'cancel_client_information.dart';

class CancelTab extends StatelessWidget {
  const CancelTab({Key key}) : super(key: key);

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
                    confirmClientsController.cancelClient != null) {
                  return ListView.builder(
                      itemCount: confirmClientsController.cancelClient.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: CancelClintDescription(
                            //  confirm: confirmed[0],
                            confirmClientModel:
                                confirmClientsController.cancelClient[index],
                            // confirmClientsController:
                            //     confirmClientsController,
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: Text("No client Cancel yet"),
                  );
                }
              }),
        )
      ],
    );
  }
}

class CancelClintDescription extends StatelessWidget {
  CancelClintDescription({Key key, this.confirmClientModel}) : super(key: key);
  //final ClientModel clientModel;
  final ConfirmClientModel confirmClientModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(CancelClientInformation(
          clientModel: confirmClientModel,
        ));
      },
      child: Container(
        height: 15 * SizeConfig.heightMultiplier,
        //  margin: EdgeInsets.only(bottom: kPadding),
        width: 0.9 * SizeConfig.screenWidth,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 03)]),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kPadding / 2,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    confirmClientModel.clientName,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "City :",
                        style: TextStyle(
                            fontSize: 1.8 * SizeConfig.textMultiplier),
                      ),
                      Text(
                        "Contact No :",
                        style: TextStyle(
                            fontSize: 1.8 * SizeConfig.textMultiplier),
                      ),
                      Text(
                        "Business type :",
                        style: TextStyle(
                            fontSize: 1.8 * SizeConfig.textMultiplier),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5 * SizeConfig.widthMultiplier,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        confirmClientModel.clientCity,
                        style: TextStyle(
                            fontSize: 1.5 * SizeConfig.textMultiplier),
                      ),
                      Text(
                        confirmClientModel.clientContact.toString(),
                        style: TextStyle(
                            fontSize: 1.8 * SizeConfig.textMultiplier),
                      ),
                      Text(
                        confirmClientModel.clientBusiness,
                        style: TextStyle(
                            fontSize: 1.8 * SizeConfig.textMultiplier),
                      ),
                    ],
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
