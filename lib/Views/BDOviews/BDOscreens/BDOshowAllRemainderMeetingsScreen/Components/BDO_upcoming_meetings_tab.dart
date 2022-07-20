import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/models/BDO_meetings_models.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class BDOshowAllUpcomingMeetings extends StatelessWidget {
  const BDOshowAllUpcomingMeetings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: meetings.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BDOupcomingMeetingsTile(
                    meeting: meetings[index],
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class BDOupcomingMeetingsTile extends StatelessWidget {
  const BDOupcomingMeetingsTile({Key key, this.meeting}) : super(key: key);
  final BDOmeetingsModels meeting;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(
            top: kPadding / 2, left: kPadding / 2, right: kPadding / 2),
        width: 0.8 * SizeConfig.screenWidth,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)],
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(kPadding / 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Subject :",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kHardTextColor),
              ),
              Text(
                "Meeting about ${meeting.description}....",
                style: TextStyle(color: Colors.grey.shade700),
              ),
              Row(
                children: [
                  Text(
                    "Meeting Time : ",
                    style: TextStyle(
                      color: kHardTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "${meeting.time}",
                    style: TextStyle(color: Colors.grey.shade700),
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
