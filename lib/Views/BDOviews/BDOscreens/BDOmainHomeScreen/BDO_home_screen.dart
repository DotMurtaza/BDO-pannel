import 'dart:convert';

import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOconfirmedProjectsScreen/confirm_Client.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOnotConfirmedProjectsScreen/MY_Clients.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOshowAllRemainderMeetingsScreen/BDO_show_all_meetings_screen.dart';
import 'package:bdo_pannel/controllers/clientController.dart';
import 'package:bdo_pannel/controllers/confirmed_Clinets_Controller.dart';
import 'package:bdo_pannel/controllers/meeting_Controller.dart';
import 'package:bdo_pannel/controllers/userController.dart';
import 'package:bdo_pannel/models/BDO_todays_meetings_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get_core/get_core.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import '../../../../constants.dart';
import 'Components/BDO_projects_container.dart';
import 'Components/BDO_todays_meetings_container.dart';
import 'package:http/http.dart' as http;

class BDOhomeScreen extends StatefulWidget {
  const BDOhomeScreen({Key key}) : super(key: key);

  @override
  _BDOhomeScreenState createState() => _BDOhomeScreenState();
}

class _BDOhomeScreenState extends State<BDOhomeScreen> {
  final UserController userController = Get.find<UserController>();
  final ClientController clientController = Get.put(ClientController());
  final ConfirmClientsController confirmClientsController =
      Get.put(ConfirmClientsController());
  final ClientMeetingController clientMeetingController =
      Get.put(ClientMeetingController());
  String userToken;
  // sendNotification() async {
  //   return await http
  //       .post(
  //     Uri.parse(
  //         'https://app.onesignal.com/apps/407b84cf-9335-45e6-afb1-1293e50db9f7/players'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, dynamic>{
  //       "app_id":
  //           kAppid, //kAppId is the App Id that one get from the OneSignal When the application is registered.

  //       "include_player_ids": [
  //         "b5feec02-7fbc-40e3-b8fd-c6164d1de5c7"
  //       ], //tokenIdList Is the List of All the Token Id to to Whom notification must be sent.

  //       // android_accent_color reprsent the color of the heading text in the notifiction
  //       "android_accent_color": "FF9976D2",

  //       "small_icon": "@mipmap/ic_launcher",

  //       //"large_icon":
  //       //  "https://www.filepicker.io/api/file/zPloHSmnQsix82nlj9Aj?filename=name.jpg",

  //       "headings": {"en": "heading"},

  //       "contents": {"en": "Content"},
  //     }),
  //   )
  //       .then((value) {
  //     print("notification send");
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }
  // void notification() {
  //   OneSignal.shared
  //       .postNotification(OSCreateNotification(
  //     additionalData: {
  //       'data': 'this is our data',
  //     },
  //     subtitle: 'Flutter in depth',
  //     playerIds: [userController.userToken],
  //     content: "hello",
  //   ))
  //       .then((value) {
  //     print("Notification send");
  //   });
  // }
  sendNotification() {
    print("user token is${userController.userToken}");
    OneSignal.shared.postNotification(OSCreateNotification(
      additionalData: {
        'data': 'this is our data',
      },
      subtitle: 'Flutter in depth',
      playerIds: [userController.userToken],
      content: 'New series lessons from Code With Ammar',
    ));
  }

  String date() {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd/MM/yyyy');
    String formattedDate = formatter.format(now);
    print(formattedDate); // 2016-01-25
    return formattedDate;
  }

  @override
  void initState() {
    super.initState();
    clientController.userClient();
    confirmClientsController.userConfirmClients();
    clientMeetingController.clientMeeting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: AnimationLimiter(
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                      verticalOffset: 50,
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                children: [
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: kPadding, left: kPadding, right: kPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Welcome",
                                    style: TextStyle(
                                        fontSize:
                                            0.02 * SizeConfig.screenHeight),
                                  ),
                                  GetX<UserController>(
                                      init: Get.find<UserController>(),
                                      builder: (UserController userController) {
                                        if (userController != null &&
                                            userController.user != null) {
                                          //print('my user is:${profileController.user.firstName}');
                                          return Text(
                                            '${userController.user.name}',
                                            style: TextStyle(
                                                fontSize: 0.03 *
                                                    SizeConfig.screenHeight,
                                                color: kPrimaryColor,
                                                fontWeight: FontWeight.w600),
                                          );
                                        } else
                                          return Text('Loading...');
                                      })
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // GestureDetector(
                                  //   onTap: () {
                                  //     Get.to(BDOnotificationsScreen());
                                  //   },
                                  //   child: SizedBox(
                                  //     height: 0.03 * SizeConfig.screenHeight,
                                  //     child: Image.asset(
                                  //         "assets/Icons/notification.png"),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 0.007 * SizeConfig.screenHeight,
                                  ),
                                  Text(date()),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 0.03 * SizeConfig.screenHeight),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // BDOprojectsContainer(
                              //   image: "assets/Icons/initial_projects.png",
                              //   title: "Initial Projects",
                              //   amount: 200,
                              //   isamount: true,
                              //   numprojects: 20,
                              //   color: Color(0xFFFAAD80),
                              //   press: () {
                              //     Get.to(BDOinitialProjectScreen());
                              //   },
                              // ),
                              GetX<ClientController>(
                                  init: Get.put(ClientController()),
                                  builder:
                                      (ClientController clientsController) {
                                    if (clientsController != null &&
                                        clientsController.clientList != null) {
                                      return BDOprojectsContainer(
                                        image:
                                            "assets/Icons/not_confirmed_projects.png",
                                        title: "Initial client",
                                        isamount: false,
                                        numprojects: clientsController
                                            .clientList.value?.length,
                                        color: Color(0xFF96BAFF),
                                        press: () {
                                          Get.to(MyClients());
                                        },
                                      );
                                    } else {
                                      return Text('loading...');
                                    }
                                  }),
                              // GetX<ConfirmClientsController>(
                              //     init: Get.put(ConfirmClientsController()),
                              //     builder: (ConfirmClientsController
                              //         confirmClientsController) {
                              //       if (confirmClientsController != null &&
                              //           confirmClientsController
                              //                   .confirmClient !=
                              //               null) {
                              //         return;
                              //       } else {
                              //         return Text('loading...');
                              //       }
                              //     }),
                              BDOprojectsContainer(
                                image: "assets/Icons/confirmed_projects.png",
                                title: "All Client",
                                // amount: confirmClientsController
                                //     .confirmClient.length,
                                amount: 10,
                                isamount: true,
                                numprojects: 20,
                                color: Color(0xFF50CB93),
                                press: () {
                                  Get.to(ConfirmClients());
                                },
                              )
                            ],
                          ),
                          SizedBox(height: 0.02 * SizeConfig.screenHeight),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [

                          // BDOprojectsContainer(
                          //   image: "assets/Icons/cancel_projects.png",
                          //   title: "Cancelled Projects",
                          //   isamount: false,
                          //   numprojects: 20,
                          //   color: Color(0xFFFF6767),
                          //   press: () {
                          //     Get.to(BDOcancelledProjectScreen());
                          //   },
                          // ),
                          //   ],
                          // ),
                          SizedBox(
                            height: 0.02 * SizeConfig.screenHeight,
                          ),
                          GestureDetector(
                            onTap: () {
                              print("press");

                              // _sendNotification();
                              sendNotification();
                            },
                            child: Text(
                              "Remainder",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 0.03 * SizeConfig.screenHeight),
                            ),
                          ),
                          SizedBox(
                            height: 0.02 * SizeConfig.screenHeight,
                          ),
                          Container(
                            height: 0.51 * SizeConfig.screenHeight,
                            width: 0.9 * SizeConfig.screenWidth,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: kPadding,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: kPadding, right: kPadding),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Today's Meetings",
                                              style: TextStyle(
                                                  color: kHardTextColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Spacer(),
                                            // GestureDetector(
                                            //   onTap: () {
                                            //     Get.to(
                                            //         BDOShowAllMeetingsScreen());
                                            //   },
                                            //   child: Text(
                                            //     "Show All",
                                            //     style: TextStyle(
                                            //         color: kHardTextColor,
                                            //         fontWeight: FontWeight.w600,
                                            //         decoration: TextDecoration
                                            //             .underline),
                                            //   ),
                                            // )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.01 * SizeConfig.screenHeight,
                                  ),
                                  GetX<ClientMeetingController>(
                                      init: Get.put(ClientMeetingController()),
                                      builder: (clientMeetingController) {
                                        if (clientMeetingController != null &&
                                            clientMeetingController
                                                    .meetingList !=
                                                null) {
                                          if (clientMeetingController
                                                  .meetingList.length ==
                                              0) {
                                            return Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 60),
                                                child: Image.asset(
                                                  'assets/Images/empty.png',
                                                  fit: BoxFit.cover,
                                                  height: SizeConfig
                                                          .heightMultiplier *
                                                      16,
                                                  width: SizeConfig
                                                          .widthMultiplier *
                                                      34,
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Container(
                                              height: 0.45 *
                                                  SizeConfig.screenHeight,
                                              // width:
                                              //     20 * SizeConfig.widthMultiplier,
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      clientMeetingController
                                                          .meetingList.length,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    var time = DateTime.now();
                                                    String formattedDate =
                                                        DateFormat('yyyy-MM-dd')
                                                            .format(time);

                                                    if (formattedDate ==
                                                        clientMeetingController
                                                            .meetingList[index]
                                                            .meetingDate
                                                            .split(" ")
                                                            .first) {
                                                      return BDOtodaysMeetingContainer(
                                                        channelId: index,
                                                        metingLength:
                                                            clientMeetingController
                                                                .meetingList
                                                                .length,
                                                        userToken: userToken,
                                                        press: () {
                                                          print(DateTime.now());
                                                          print(DateTime.parse(
                                                              clientMeetingController
                                                                  .meetingList[
                                                                      index]
                                                                  .meetingDate));
                                                        },
                                                        meetingModel:
                                                            clientMeetingController
                                                                    .meetingList[
                                                                index],
                                                      );
                                                    } else {
                                                      return SizedBox();
                                                    }
                                                    // String formatDate =
                                                    //     new DateFormat
                                                    //             .yMMMMEEEEd()
                                                    //         .format(time);
                                                    // print(formatDate);
                                                  }),
                                            );
                                          }
                                        } else {
                                          return Text("No Meeting for today");
                                        }
                                      })
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
