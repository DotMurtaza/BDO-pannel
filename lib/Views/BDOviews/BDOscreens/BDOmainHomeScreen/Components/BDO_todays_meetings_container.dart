import 'dart:async';

import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/controllers/userController.dart';
import 'package:bdo_pannel/models/meeting_Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../../../../../constants.dart';
import '../../../../../main.dart';

class BDOtodaysMeetingContainer extends StatefulWidget {
  const BDOtodaysMeetingContainer({
    Key key,
    @required this.press,
    this.meetingModel,
    this.userToken,
    this.metingLength,
    this.channelId,
  }) : super(key: key);

  final VoidCallback press;
  final MeetingModel meetingModel;
  final String userToken;
  final int metingLength;
  final int channelId;

  @override
  _BDOtodaysMeetingContainerState createState() =>
      _BDOtodaysMeetingContainerState();
}

class _BDOtodaysMeetingContainerState extends State<BDOtodaysMeetingContainer> {
  final UserController userController = Get.put(UserController());

  int isNotification;
  //String getTime;
  //String showTime;
  bool meetingTimeOver;
  var currentTime;
  var comapreTime;

  //bool isRemainingTime = false;

  var check;
  String meetingTime;
  @override
  void initState() {
    meetingTime = widget.meetingModel.meetingDate.split(" ").last;
    super.initState();
    print("userToken is ${widget.userToken}");

    meetingTimeOver = false;
    // isRemainingTime = false;
    currentTime = DateTime.now();
    comapreTime = DateTime.parse(widget.meetingModel.meetingDate);
    check = currentTime.difference(comapreTime);
    print(check.inMinutes);
    if (check.inMinutes >= 1) {
      setState(() {
        meetingTimeOver = true;
      });
    }
    //getTime = widget.meetingModel.meetingDate.split(" ").last;
    //showTime = getTime.split(".").first;

    // else if (check.inMinutes > -10 && check.inMinutes < 1) {
    //   print(
    //       "notification call time Diff is $check and id is ${widget.meetingModel.id}  ");
    //   scheduleAlarm();
    // }
    if (widget.metingLength != 0) {
      sendNotification(widget.meetingModel.notification);
    } else {
      print("else is ${widget.metingLength}");
    }
    // Timer(const Duration(seconds: 1), () {
    //   callback();
    // });
  }

  // void callback() {
  //   print("yess");
  //   Timer(const Duration(seconds: 1), () {
  //     // callback();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return meetingTimeOver
        ? SizedBox()
        : GestureDetector(
            onTap: widget.press,
            child: Container(
              margin: EdgeInsets.only(
                  top: kPadding / 2, left: kPadding / 2, right: kPadding / 2),
              width: 0.8 * SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(2, -2)),
                  ],
                  color: widget.meetingModel.notification == 1
                      ? Colors.red.withOpacity(0.6)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.all(kPadding / 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.meetingModel.clientName,
                      style: TextStyle(
                        fontSize: 0.0165 * SizeConfig.screenHeight,
                        color: widget.meetingModel.notification == 1
                            ? Colors.white
                            : kHardTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 0.005 * SizeConfig.screenHeight,
                    ),
                    Text(
                      "Meeting about ${widget.meetingModel.discription}....",
                      style: TextStyle(
                          fontSize: 0.0165 * SizeConfig.screenHeight,
                          fontWeight: FontWeight.w500,
                          color: widget.meetingModel.notification == 1
                              ? Colors.white
                              : Colors.grey.shade700),
                    ),
                    SizedBox(
                      height: 0.005 * SizeConfig.screenHeight,
                    ),
                    Row(
                      children: [
                        Text(
                          "Meeting Time : ",
                          style: TextStyle(
                            color: widget.meetingModel.notification == 1
                                ? Colors.white
                                : kHardTextColor,
                            fontSize: 0.0165 * SizeConfig.screenHeight,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "${widget.meetingModel.meetingDate.split(" ").last.split(".").first}",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 0.0165 * SizeConfig.screenHeight,
                                color: widget.meetingModel.notification == 1
                                    ? Colors.white
                                    : Colors.grey.shade700),
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

  void sendNotification(int notificationStatus) async {
    if (check.inMinutes > -10 &&
        check.inMinutes < 1 &&
        notificationStatus == 0) {
      print("print check time is ${check.inMinutes}");
      print(
          "notification status is ${widget.meetingModel.notification} and id ${widget.meetingModel.id}");
      // print(
      //     "call in if id is  ${widget.meetingModel.id} status is ${widget.meetingModel.notification} diffrence is ${check.inMinutes}");
      // print("user token is in meeting ${userController.userToken}");
      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'alarm_notif',
        'alarm_notif',
        'Channel for Alarm notification',
        icon: '@mipmap/ic_launcher',
        sound: RawResourceAndroidNotificationSound(
            'android_app_src_main_res_raw_a_long_cold_sting'),
        largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
      );

      var iOSPlatformChannelSpecifics = IOSNotificationDetails(
          sound: 'android_app_src_main_res_raw_a_long_cold_sting.wave',
          presentAlert: true,
          presentBadge: true,
          presentSound: true);
      var platformChannelSpecifics = NotificationDetails(
          android: androidPlatformChannelSpecifics,
          iOS: iOSPlatformChannelSpecifics);

      FirebaseFirestore.instance
          .collection("Users")
          .doc(userController.users.uid)
          .collection("Meetings")
          .doc(widget.meetingModel.id)
          .update({"notification": 1}).then((value) async {
        await flutterLocalNotificationsPlugin
            .schedule(
                widget.channelId,
                'Meeting Alert !',
                "Your meeting with ${widget.meetingModel.id} at ${widget.meetingModel.meetingDate.split(" ").last.split(".").first}",
                DateTime.now(),
                platformChannelSpecifics)
            .then((value) {
          Timer(const Duration(seconds: 8), () {
            currentTime = DateTime.now();
            comapreTime = DateTime.parse(widget.meetingModel.meetingDate);
            check = currentTime.difference(comapreTime);
            print("in if check time $check");
            checkNotification();
            //sendNotification();
          });
        });
      });

      /// await flutterLocalNotificationsPlugin
      //.show(3, "hello", "checkk", platformChannelSpecifics)
      // .showWeeklyAtDayAndTime(3, "office", '', Day.tuesday,
      //     Time(11, 06, 00), platformChannelSpecifics,
      //     payload: "fkl")\
      // if (widget.meetingModel.notification == 1) {
      //   checkNotification();
      // } else {
      //   await flutterLocalNotificationsPlugin
      //       .schedule(
      //           widget.channelId,
      //           'Meeting Alert !',
      //           "Your meeting with ${widget.meetingModel.id} at ${widget.meetingModel.meetingDate.split(" ").last.split(".").first}",
      //           DateTime.now(),
      //           platformChannelSpecifics)

      //       // OneSignal.shared
      //       //     .postNotification(OSCreateNotification(
      //       //   additionalData: {
      //       //     'data': 'this is our data',
      //       //   },
      //       //   subtitle: 'Flutter in depth',
      //       //   playerIds: [userController.userToken],
      //       //   content: widget.meetingModel.id,
      //       // ))
      //       .then((value) {
      //     FirebaseFirestore.instance
      //         .collection("Users")
      //         .doc(userController.users.uid)
      //         .collection("Meetings")
      //         .doc(widget.meetingModel.id)
      //         .update({"notification": 1}).then((value) {
      //       print("value update");
      //     }).then((value) {
      //       Timer(const Duration(seconds: 8), () {
      //         currentTime = DateTime.now();
      //         comapreTime = DateTime.parse(widget.meetingModel.meetingDate);
      //         check = currentTime.difference(comapreTime);
      //         print("in if check time $check");
      //         checkNotification();
      //         //sendNotification();
      //       });
      //     });
      //   });
      // }

      //print("Call in if ");

    } else {
      currentTime = DateTime.now();
      comapreTime = DateTime.parse(widget.meetingModel.meetingDate);
      check = currentTime.difference(comapreTime);
      print("in else check time $check");

      // print(
      //     "call in else id is  ${widget.meetingModel.id} status is ${widget.meetingModel.notification} diffrence is ${check.inMinutes}");
      if (check.inMinutes >= 1 && meetingTimeOver == false) {
        setState(() {
          meetingTimeOver = true;
        });
      }

      Timer(const Duration(seconds: 30), () {
        FirebaseFirestore.instance
            .collection("Users")
            .doc(userController.users.uid)
            .collection("Meetings")
            .doc(widget.meetingModel.id)
            .get()
            .then((value) {
          print("status is  in else ${value.data()["notification"]}");
          sendNotification(value.data()["notification"]);
        });
        //sendNotification();
      });
    }
  }

  void checkNotification() {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(userController.users.uid)
        .collection("Meetings")
        .doc(widget.meetingModel.id)
        .get()
        .then((value) {
      print("status us ${value.data()["notification"]}");
      sendNotification(value.data()["notification"]);
      print(
          "call in checkNotification status is ${value.data()["notification"]}");
    });
  }

  // void scheduleAlarm(
  //   DateTime scheduledNotificationDateTime,
  // ) async {

  //   //scheduleAlarm(DateTime.now());
  // }
//   showNotification(RemoteMessage message) {
//   RemoteNotification notification = message.notification;
//   AndroidNotification android = message.notification?.android;
//   String action = message.data['action']; // get the value set in action key from FCM Json in Step1
//   // local notification to show to users using the created channel.
//   if (notification != null && android != null) {
//     flutterLocalNotificationsPlugin.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         NotificationDetails(
//             android: androidNotificationDetails, iOS: iOSNotificationDetails),
//         payload: action // set the value of payload
//     );
//   }
// }
}
