import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOaddMeetingScreen/BDO_add_meeting_screen.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOconfimedMeetingTabs/BDOConfirmedMeetingTab/Components/addMeeting.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_my_date_picker.dart';
import 'package:bdo_pannel/controllers/meeting_Controller.dart';
import 'package:bdo_pannel/models/BDO_meetings_models.dart';
import 'package:bdo_pannel/models/confirm_client_model.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../constants.dart';
import 'Components/BDO_confirmed_meetings_tile.dart';
import 'clientPastMeeting.dart';

class MeetingTabs extends StatelessWidget {
  final ConfirmClientModel confirmClientModel;
  const MeetingTabs({Key key, this.confirmClientModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Clinet id is ${confirmClientModel.id} ");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF50CB93),
        title: Text(
          "Client Meetings",
        ),
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(
                  top: kPadding / 2, left: kPadding, right: kPadding),
              child: Container(
                  height: 0.8 * SizeConfig.screenHeight,
                  width: 1 * SizeConfig.screenWidth,
                  child: ContainedTabBarView(
                    tabs: [
                      Text(
                        "UpComing",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 0.016 * SizeConfig.screenHeight),
                      ),
                      // Text(
                      //   "Not Updated",
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.w600,
                      //       fontSize: 0.016 * SizeConfig.screenHeight),
                      // ),
                      Text(
                        "All",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 0.016 * SizeConfig.screenHeight),
                      )
                    ],
                    tabBarProperties: TabBarProperties(
                      height: 0.06 * SizeConfig.screenHeight,
                      width: 0.97 * SizeConfig.screenWidth,
                      background: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.01 * SizeConfig.screenWidth),
                      indicator: ContainerTabIndicator(
                          height: 0.05 * SizeConfig.screenHeight,
                          color: Colors.white,
                          radius: BorderRadius.circular(50),
                          borderColor: Colors.black),
                      indicatorColor: Colors.transparent,
                      labelColor: kPrimaryColor,
                      unselectedLabelColor: Colors.black,
                    ),
                    views: [
                      BDOConfirmedMeetingsTab(
                        confirmClientModel: confirmClientModel,
                      ),
                      //BDOallNotUpdatedMeetingsTab(),
                      PastMeeting(
                        confirmClientModel: confirmClientModel,
                        id: confirmClientModel.id,
                      )
                    ],
                  ))
              //
              )),
    );
  }
}

class BDOConfirmedMeetingsTab extends StatefulWidget {
  const BDOConfirmedMeetingsTab({Key key, this.id, this.confirmClientModel})
      : super(key: key);
  final String id;
  final ConfirmClientModel confirmClientModel;

  @override
  _BDOConfirmedMeetingsTabState createState() =>
      _BDOConfirmedMeetingsTabState();
}

class _BDOConfirmedMeetingsTabState extends State<BDOConfirmedMeetingsTab> {
// final clientMeetingController = Get.put(ClientMeetingController());

  @override
  void initState() {
    print('in it state : ${widget.confirmClientModel.id}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddMeeting(
                confirmClientModel: widget.confirmClientModel,
                ismeeting: true,
                color: kPrimaryColor,
              ));
        },
        child: Icon(Icons.add),
      ),
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
                          String getTime;
                          String showTime;
                          var time = DateTime.now();
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(time);
                          var currentTime = DateTime.now();
                          var comapreTime = DateTime.parse(indController
                              .indiviualMeetingList[index].meetingDate);
                          var check = currentTime.difference(comapreTime);
                          print(check.inMinutes);
                          getTime = indController
                              .indiviualMeetingList[index].meetingDate
                              .split(" ")
                              .last;
                          print("formated date is $formattedDate");
                          print("diffrence is ${check.inMinutes}");
                          print(indController
                              .indiviualMeetingList[index].meetingDate
                              .split(" ")
                              .first);
                          showTime = getTime.split(".").first;
                          if (check.inMinutes >= 1 ||
                              formattedDate !=
                                  indController
                                      .indiviualMeetingList[index].meetingDate
                                      .split(" ")
                                      .first) {
                            return SizedBox();
                          } else {
                            return
                                // Text("hi");
                                BDOConfirmedmeetingTile(
                              meetingModel:
                                  indController.indiviualMeetingList[index],
                              //meet: meetings[index],
                            );
                          }
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
