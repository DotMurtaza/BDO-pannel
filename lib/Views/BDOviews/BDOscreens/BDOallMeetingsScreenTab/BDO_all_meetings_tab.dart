import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOaddMeetingScreen/BDO_add_meeting_screen.dart';
import 'package:bdo_pannel/controllers/meeting_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import 'Components/BDO_all_meetings_tile.dart';

class BDOallMeetingsTab extends StatefulWidget {
  //final MeetingController meetingController = Get.put(MeetingController());
  BDOallMeetingsTab({Key key}) : super(key: key);

  @override
  _BDOallMeetingsTabState createState() => _BDOallMeetingsTabState();
}

class _BDOallMeetingsTabState extends State<BDOallMeetingsTab> {
  final searchController = TextEditingController();
  bool isText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 0.01 * SizeConfig.screenHeight),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                autofocus: false,
                decoration: InputDecoration(
                    suffixIcon: isText
                        ? Icon(
                            Icons.search,
                            color: Colors.black,
                          )
                        : IconButton(
                            icon: Icon(
                              Icons.cancel,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              searchController.clear();
                              setState(() {
                                isText = true;
                              });
                            }),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    isText = false;
                  });
                },
              ),
            ),
            // BDOSearchAndFilter(),
            SizedBox(height: 0.01 * SizeConfig.screenHeight),
            // Padding(
            //   padding: EdgeInsets.symmetric(
            //       horizontal: 0.04 * SizeConfig.screenWidth),
            //   child: BDOdateWidget(
            //     label: 'Select Date',
            //     valueKey: 'meeting_date',
            //   ),
            // ),
            // GetX<ClientMeetingController>(
            //     init: Get.put(ClientMeetingController()),
            //     builder: (ClientMeetingController clientMeetingController) {
            //       if (clientMeetingController != null &&
            //           clientMeetingController.meetingList != null) {
            //         //print('my user is:${profileController.user.firstName}');
            //         return Text(
            //           'HI',
            //           style: TextStyle(
            //               fontSize: 0.03 * SizeConfig.screenHeight,
            //               color: kPrimaryColor,
            //               fontWeight: FontWeight.w600),
            //         );
            //       } else
            //         return Text('Loading...');
            //     })
            GetX<ClientMeetingController>(
                init:
                    Get.put<ClientMeetingController>(ClientMeetingController()),
                builder: (ClientMeetingController meetingController) {
                  if (meetingController.meetingList != null &&
                      meetingController != null) {
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: meetingController.meetingList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return meetingController.meetingList[index].clientName
                                  .toUpperCase()
                                  .contains(searchController.text.toUpperCase())
                              ? BDOallMeetingsTile(
                                  meetingModel:
                                      meetingController.meetingList[index],
                                )
                              : Container();
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          onPressed: () {
            Get.to(BDOaddMeetingPage(
              ismeeting: true,
              color: kPrimaryColor,
            ));
          },
          backgroundColor: kPrimaryColor,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
