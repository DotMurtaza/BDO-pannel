
import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOaddMeetingScreen/BDO_add_meeting_screen.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_my_date_picker.dart';
import 'package:bdo_pannel/models/BDO_meetings_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';
import 'Components/BDO_not_confirmed_meetings_tile.dart';

class BDOnotConfirmedMeetingsTab extends StatelessWidget {
  const BDOnotConfirmedMeetingsTab({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 0.01 * SizeConfig.screenHeight),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 0.04 * SizeConfig.screenWidth),
              child: BDOdateWidget(
                label: 'Select Date',
                valueKey: 'meeting_date',
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: meetings.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BDOnotConfirmedmeetingTile(
                    meet: meetings[index],
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(BDOaddMeetingPage(
            ismeeting: false,
            color: notConfirmedColor,
          ));
        },
        backgroundColor: notConfirmedColor,
        child: Icon(Icons.add),
      ),
    );
  }
}
