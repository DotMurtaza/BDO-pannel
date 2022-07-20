import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/controllers/meeting_Controller.dart';
import 'package:bdo_pannel/models/confirm_client_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Components/BDO_confirmed_meetings_tile.dart';

class PastMeeting extends StatefulWidget {
  const PastMeeting({Key key, this.id, this.confirmClientModel})
      : super(key: key);
  final String id;
  final ConfirmClientModel confirmClientModel;

  @override
  _BDOConfirmedMeetingsTabState createState() =>
      _BDOConfirmedMeetingsTabState();
}

class _BDOConfirmedMeetingsTabState extends State<PastMeeting> {
  //final clientMeetingController = Get.put(ClientMeetingController());

  @override
  void initState() {
    print('in it state : ${widget.id}');
    // clientMeetingController.getIndividualMeeting(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Confirm Client meeting'),
      //   backgroundColor: confirmedColor,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 0.01 * SizeConfig.screenHeight),
            // Padding(
            //   padding: EdgeInsets.symmetric(
            //       horizontal: 0.04 * SizeConfig.screenWidth),
            //   child: BDOdateWidget(
            //     label: 'Select Date',
            //     valueKey: 'meeting_date',
            //   ),
            // ),
            GetX<ClientMeetingController>(
                init:
                    Get.put<ClientMeetingController>(ClientMeetingController()),
                builder: (ClientMeetingController indController) {
                  if (indController != null &&
                      indController.indiviualMeetingList != null) {
                    //print('my user is:${profileController.user.firstName}');
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: indController.indiviualMeetingList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return BDOConfirmedmeetingTile(
                            meetingModel:
                                indController.indiviualMeetingList[index],
                            //meet: meetings[index],
                          );
                        });
                  } else
                    return Center(
                        child: Text(
                      'No meeting found for this client',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ));
                })
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Get.to(BDOaddMeetingPage(
      //       ismeeting: false,
      //       color: confirmedColor,
      //     ));
      //   },
      //   backgroundColor: confirmedColor,
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
