
import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOallMeetingsDetailsScreen/BDO_all_meeting_details.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOupdateMeetingScreen/BDO_update_meeting_discussion_screen.dart';
import 'package:bdo_pannel/models/BDO_meetings_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants.dart';

class BDOnotConfirmedNotUpdatedTile extends StatelessWidget {
  const BDOnotConfirmedNotUpdatedTile({Key key, this.meet}) : super(key: key);
  final BDOmeetingsModels meet;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(BDOmeetingDetailsPage(
          color: notConfirmedColor,
          meeting: meet,
        ));
      },
      child: Container(
        margin: EdgeInsets.only(
            top: kPadding / 2, left: kPadding / 2, right: kPadding / 2),
        width: 0.8 * SizeConfig.screenWidth,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)],
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(kPadding / 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${meet.title} :",
                    style: TextStyle(
                      fontSize: 0.017 * SizeConfig.screenHeight,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 0.04 * SizeConfig.screenHeight,
                    child: PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem<String>(
                          child: Text("Update"),
                          value: "update",
                        ),
                        PopupMenuItem<String>(
                          child: Text("Delete"),
                          value: "delete",
                        )
                      ],
                      onSelected: (value) {
                        if (value == "update") {
                          Get.to(BDOupdateMeetingDiscussion(
                            color: notConfirmedColor,
                          ));
                        }
                        if (value == "delete") {
                          print("deleted");
                        }
                      },
                    ),
                  )
                ],
              ),
              Text(
                "Subject :",
                style: TextStyle(
                  fontSize: 0.017 * SizeConfig.screenHeight,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 0.005 * SizeConfig.screenHeight,
              ),
              Text(
                "${meet.description}....",
                style: TextStyle(color: Colors.grey.shade600),
              ),
              SizedBox(
                height: 0.005 * SizeConfig.screenHeight,
              ),
              Row(
                children: [
                  Text(
                    "Meeting Time : ",
                    style: TextStyle(
                      fontSize: 0.017 * SizeConfig.screenHeight,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "${meet.time}",
                    style: TextStyle(
                        fontSize: 0.017 * SizeConfig.screenHeight,
                        color: Colors.grey.shade600),
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
