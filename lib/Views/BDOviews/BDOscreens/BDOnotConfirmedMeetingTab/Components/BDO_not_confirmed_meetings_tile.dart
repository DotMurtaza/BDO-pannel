
import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOallMeetingsDetailsScreen/BDO_all_meeting_details.dart';
import 'package:bdo_pannel/models/BDO_meetings_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants.dart';

class BDOnotConfirmedmeetingTile extends StatelessWidget {
  const BDOnotConfirmedmeetingTile({Key key, this.meet}) : super(key: key);
  final BDOmeetingsModels meet;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(BDOmeetingDetailsPage(
          meeting: meet,
          color: notConfirmedColor,
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
                "${meet.title} :",
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
                "BDO, Client, Team Member",
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
                meet.description,
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
                    meet.time,
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
