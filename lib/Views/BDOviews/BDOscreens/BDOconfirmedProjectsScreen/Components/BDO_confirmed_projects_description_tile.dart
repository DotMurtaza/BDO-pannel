import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOconfimedMeetingTabs/BDOConfirmedMeetingTab/BDO_confirmed_meeting_tab.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOconfirmedMeetingsScreen/BDO_confirmed_meetings_screen.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOprojectsDetailsScreen/client_Information_Screen.dart';
import 'package:bdo_pannel/controllers/confirmed_Clinets_Controller.dart';
import 'package:bdo_pannel/controllers/meeting_Controller.dart';
import 'package:bdo_pannel/models/BDO_all_projects_models.dart';
import 'package:bdo_pannel/models/confirm_client_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants.dart';

class BDOconfirmedProjectDescriptionContainer extends StatefulWidget {
  BDOconfirmedProjectDescriptionContainer({
    Key key,
    this.confirm,
    this.confirmClientModel,
    // this.confirmClientsController,
  }) : super(key: key);
  final BDOallProjectModels confirm;
  final ConfirmClientModel confirmClientModel;
  //final ConfirmClientsController confirmClientsController;

  @override
  _BDOconfirmedProjectDescriptionContainerState createState() =>
      _BDOconfirmedProjectDescriptionContainerState();
}

class _BDOconfirmedProjectDescriptionContainerState
    extends State<BDOconfirmedProjectDescriptionContainer> {
  final ClientMeetingController clientMeetingController =
      Get.put(ClientMeetingController());
  String name;

  // final confirmClientsController = Get.find<ConfirmClientsController>();
  //final meetingController = Get.put(ClientMeetingController());
  @override
  void initState() {
    // meetingController.getIndividualMeeting(widget.confirmClientModel.id);
    super.initState();
    //
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(
        //   BDOprojectDetailsScreen(
        //   notconfirmed: true,
        //   color: Color(0xFF50CB93),
        //   projecttitle: widget.confirm.title,
        //   type: widget.confirm.type,
        //   source: widget.confirm.source,
        //   cost: widget.confirm.cost,
        //   description: widget.confirm.descriptiondetails,
        //   clientname: widget.confirm.clientName,
        //   clientcontact: widget.confirm.clientContact,
        //   clientEmail: widget.confirm.clientEmail,
        //   clientCountry: widget.confirm.clientCountry,
        // )
        // );
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // GetX<ConfirmClientsController>(
                  //     init: Get.find<ConfirmClientsController>(),
                  //     builder:
                  //         (ConfirmClientsController confirmClientsController) {
                  //       return Text(
                  //         confirmClientsController.clientName.value,
                  //         style: TextStyle(fontWeight: FontWeight.w500),
                  //       );
                  //     }),
                  Text(
                    widget.confirmClientModel.clientName,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  // Obx(
                  //   () => Text(
                  //     confirmClientsController.clientName,
                  //     style: TextStyle(fontWeight: FontWeight.w500),
                  //   ),
                  // ),
                  Spacer(),
                  PopupMenuButton(
                    itemBuilder: (context) => [
                      // PopupMenuItem<String>(
                      //     child: Text("Details"), value: "details"),
                      PopupMenuItem<String>(
                        child: Text("Meetings"),
                        value: "meetings",
                      ),
                    ],
                    onSelected: (value) {
                      if (value == "details") {
                        // Get.to(BDOprojectDetailsScreen(
                        //   notconfirmed: true,
                        //   color: Color(0xFF50CB93),
                        //   projecttitle: widget.confirm.title,
                        //   type: widget.confirm.type,
                        //   source: widget.confirm.source,
                        //   cost: widget.confirm.cost,
                        //   description: widget.confirm.descriptiondetails,
                        //   clientname: widget.confirm.clientName,
                        //   clientcontact: widget.confirm.clientContact,
                        //   clientEmail: widget.confirm.clientEmail,
                        //   clientCountry: widget.confirm.clientCountry,
                        // ));
                      }
                      if (value == "meetings") {
                        print(widget.confirmClientModel.clientName);
                        print(widget.confirmClientModel.id);
                        clientMeetingController
                            .getIndividualMeeting(widget.confirmClientModel.id);
                        Get.to(() => MeetingTabs(
                              confirmClientModel: widget.confirmClientModel,
                            ));
                        // BDOConfirmedMeetingsTab(
                        //       confirmClientModel: widget.confirmClientModel,
                        //       id: widget.confirmClientModel.id,
                        //     ));
                        //print('Id is : ${widget.confirmClientModel.id}');
                        // Get.to(() => BDOConfirmedMeetingsScreen());
                      }
                    },
                  ),
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
                        widget.confirmClientModel.clientCity,
                        style: TextStyle(
                            fontSize: 1.5 * SizeConfig.textMultiplier),
                      ),
                      Text(
                        widget.confirmClientModel.clientContact.toString(),
                        style: TextStyle(
                            fontSize: 1.8 * SizeConfig.textMultiplier),
                      ),
                      Text(
                        widget.confirmClientModel.clientBusiness,
                        style: TextStyle(
                            fontSize: 1.8 * SizeConfig.textMultiplier),
                      ),
                    ],
                  )
                ],
              ),
              // Text(
              //   widget.confirm.description,
              //   style: TextStyle(
              //     fontSize: 0.017 * SizeConfig.screenHeight,
              //     fontWeight: FontWeight.w400,
              //     color: Colors.grey.shade700,
              //   ),
              // ),
              // Align(
              //   alignment: Alignment.bottomRight,
              //   child: Text(
              //     widget.confirm.date,
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
