import 'package:bdo_pannel/controllers/meeting_Controller.dart';
import 'package:bdo_pannel/models/BDO_meetings_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Components/BDO_all_up_coming_meetings_tile.dart';
class BDOallUpComingMeetingsTab extends StatefulWidget {
  const BDOallUpComingMeetingsTab({Key key}) : super(key: key);

  @override
  _BDOallUpComingMeetingsTabState createState() => _BDOallUpComingMeetingsTabState();
}

class _BDOallUpComingMeetingsTabState extends State<BDOallUpComingMeetingsTab> {
  final ClientMeetingController clientMeetingController=Get.put(ClientMeetingController());
  @override
  void initState() {
    clientMeetingController.getUpcomingMeeting();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetX<ClientMeetingController>(
                init:
                Get.put<ClientMeetingController>(ClientMeetingController()),
                builder: (ClientMeetingController meetingController) {
                  if (meetingController.upcomingList != null &&
                      meetingController != null) {
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: meetingController.upcomingList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return BDOallUpComingMeetingsTile(
                            meetingModel: meetingController.upcomingList[index],
                          );
                        });

                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
    );
  }
}
