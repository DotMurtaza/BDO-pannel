import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOallMeetingsDetailsScreen/BDO_all_meeting_details.dart';
import 'package:bdo_pannel/models/BDO_meetings_models.dart';
import 'package:bdo_pannel/models/confirm_client_model.dart';
import 'package:bdo_pannel/models/meeting_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constants.dart';

class BDOConfirmedmeetingTile extends StatefulWidget {
  const BDOConfirmedmeetingTile({Key key, this.meetingModel}) : super(key: key);
  //final BDOmeetingsModels meet;
  final MeetingModel meetingModel;

  @override
  _BDOConfirmedmeetingTileState createState() =>
      _BDOConfirmedmeetingTileState();
}

class _BDOConfirmedmeetingTileState extends State<BDOConfirmedmeetingTile> {
  String splitDate;
  String getTime;
  String showTime;
  @override
  void initState() {
    splitDate = widget.meetingModel.meetingDate.split(" ").last;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(BDOmeetingDetailsPage(
          meetingModel: widget.meetingModel,
          color: confirmedColor,
        ));
      },
      child: Container(
        margin: EdgeInsets.only(
            top: kPadding / 2, left: kPadding / 2, right: kPadding / 2),
        width: 0.9 * SizeConfig.screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)]),
        child: Padding(
          padding: EdgeInsets.all(kPadding / 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.meetingModel.projectName.toUpperCase()}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Attenders :",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${widget.meetingModel.clientName}',
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(
                height: 0.01 * SizeConfig.screenHeight,
              ),
              Text(
                "Meeting Disscussion :",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${widget.meetingModel.discription}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(
                height: 0.01 * SizeConfig.screenHeight,
              ),
              Row(
                children: [
                  Text(
                    "Meeting Time :",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '${widget.meetingModel.meetingDate.split(" ").last.split(".").first}',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
