import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOnotConfirmedMeetingsScreen/BDO_not_confirmed_meeting_screen.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOprojectsDetailsScreen/client_Information_Screen.dart';
import 'package:bdo_pannel/models/BDO_all_projects_models.dart';
import 'package:bdo_pannel/models/client_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants.dart';

class MyClientInformationContainer extends StatelessWidget {
  const MyClientInformationContainer({
    Key key,
    this.clientModel,
  }) : super(key: key);

  final ClientModel clientModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ClientInformation(
          clientModel: clientModel,
        ));
      },
      child: Container(
        height: 12 * SizeConfig.heightMultiplier,
        margin: EdgeInsets.only(bottom: kPadding / 2),
        width: 0.9 * SizeConfig.screenWidth,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 03)]),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kPadding / 2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.5 * SizeConfig.heightMultiplier,
              ),
              Row(
                children: [
                  Text(
                    clientModel.clientName,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  // PopupMenuButton(
                  //   itemBuilder: (context) => [
                  //     PopupMenuItem<String>(
                  //       child: Text("Details"),
                  //       value: "details",
                  //     ),
                  //     PopupMenuItem<String>(
                  //       child: Text("Meetings"),
                  //       value: "meetings",
                  //     )
                  //   ],
                  //   onSelected: (value) {
                  //     if (value == "details") {
                  //       Get.to(BDOprojectDetailsScreen(
                  //           notconfirmed: false,
                  //           color: Color(0xFF96BAFF),
                  //           projecttitle: notConfirm.title,
                  //           type: notConfirm.type,
                  //           source: notConfirm.source,
                  //           description: notConfirm.description,
                  //           clientname: notConfirm.clientName,
                  //           clientEmail: notConfirm.clientEmail,
                  //           clientCountry: notConfirm.clientCountry,
                  //           cost: notConfirm.cost,
                  //           clientcontact: notConfirm.clientContact));
                  //     }
                  //     if (value == "meetings") {
                  //       Get.to(BDOnotConfirmedMeetingsScreen());
                  //     }
                  //   },
                  // )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        clientModel.clientCity,
                        style: TextStyle(
                            fontSize: 1.5 * SizeConfig.textMultiplier),
                      ),
                      Text(
                        clientModel.clientContact.toString(),
                        style: TextStyle(
                            fontSize: 1.8 * SizeConfig.textMultiplier),
                      ),
                      Text(
                        clientModel.clientBusiness,
                        style: TextStyle(
                            fontSize: 1.8 * SizeConfig.textMultiplier),
                      ),
                    ],
                  )
                ],
              ),
              // Text(
              //   clientModel.clientContact.toString(),
              //   style: TextStyle(
              //     fontSize: 0.017 * SizeConfig.screenHeight,
              //     fontWeight: FontWeight.w400,
              //     color: Colors.grey.shade700,
              //   ),
              // ),
              // Align(
              //   alignment: Alignment.bottomRight,
              //   child: Text(
              //     clientModel.time.toDate().toString(),
              //     style: TextStyle(
              //         fontSize: 0.016 * SizeConfig.screenHeight,
              //         color: Colors.grey.shade500,
              //         fontWeight: FontWeight.w300),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
