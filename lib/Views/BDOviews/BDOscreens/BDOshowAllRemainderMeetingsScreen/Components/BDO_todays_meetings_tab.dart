import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOmainHomeScreen/Components/BDO_todays_meetings_container.dart';
import 'package:bdo_pannel/models/BDO_todays_meetings_models.dart';
import 'package:flutter/material.dart';

class BDOshowAllTodayMeetings extends StatelessWidget {
  const BDOshowAllTodayMeetings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: todaysmeetings.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BDOtodaysMeetingContainer(
                    press: () {},
                    // meeting: todaysmeetings[index],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
