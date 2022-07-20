import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_input_field.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_my_button.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_my_date_picker.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_my_drop_down.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_my_time_picker.dart';
import 'package:bdo_pannel/controllers/confirmed_Clinets_Controller.dart';
import 'package:bdo_pannel/controllers/meeting_Controller.dart';
import 'package:bdo_pannel/controllers/userController.dart';
import 'package:bdo_pannel/models/confirm_client_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../../constants.dart';

class AddMeeting extends StatefulWidget {
  const AddMeeting(
      {Key key, this.color, @required this.ismeeting, this.confirmClientModel});

  final Color color;
  final bool ismeeting;
  final ConfirmClientModel confirmClientModel;

  @override
  _BDOaddMeetingPageState createState() => _BDOaddMeetingPageState();
}

class _BDOaddMeetingPageState extends State<AddMeeting> {
  String clientId;
  String clientName;
  var dropdownvalue;
  DateTime pickedDate;
  TimeOfDay time;
  String showTime;
  String formatted;
  DateTime getDateandTime;
  final key = GlobalKey<FormState>();
  String formattedDate;

  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    print("Fomated time is ${format.format(dt)}");

    return format.format(dt);
  }

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    formattedDate = DateFormat('yyyy-MM-dd hh-mm').format(pickedDate);
    time = TimeOfDay.now();
    showTime = "12:00 AM";
  }

  // var items = [
  //   'Apple',
  //   'Banana',
  //   'Grapes',
  //   'Orange',
  //   'watermelon',
  //   'Pineapple'
  // ];
  final meetingController = Get.find<ClientMeetingController>();
  final UserController userController = Get.put(UserController());

  // final confirmClientsController =
  //     Get.put(ConfirmClientsController());

  @override
  Widget build(BuildContext context) {
    String formatDate = new DateFormat.yMMMd().format(pickedDate);
    return Scaffold(
        appBar: AppBar(
            // leading: IconButton(),
            elevation: 0,
            backgroundColor: widget.color,
            title: Text("Add Meeting")),
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: Container(
            height: SizeConfig.heightMultiplier * 90,
            width: SizeConfig.widthMultiplier * 100,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPadding),
                child: Form(
                  key: key,
                  child: Column(
                    children: [
                      const SizedBox(height: kPadding * 1.5),
                      ListTile(
                        onTap: () {
                          DatePicker.showDateTimePicker(context,
                              showTitleActions: true,
                              minTime: DateTime.now(), onChanged: (date) {
                            print('change is $date in time zone ' +
                                date.timeZoneOffset.inHours.toString());
                          }, onConfirm: (date) {
                            print('confirm $date');
                            setState(() {
                              formattedDate = date.toString();
                              showTime = formattedDate.split(" ").last;
                            });
                          });
                        },
                        title: Text(
                          "${formattedDate.split(" ").first}  at  ${showTime.split(".").first}",
                          style: TextStyle(
                              fontSize: 3 * SizeConfig.textMultiplier),
                        ),
                        trailing: Icon(
                          Icons.calendar_today_outlined,
                          color: widget.color,
                          size: 5 * SizeConfig.imageSizeMultiplier,
                        ),
                      ),

                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Attenders:",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Container(
                              width: SizeConfig.widthMultiplier * 90,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Client',
                                      style: TextStyle(
                                          fontSize:
                                              2 * SizeConfig.textMultiplier),
                                    ),
                                    Text(
                                      widget.confirmClientModel.clientName,
                                      style: TextStyle(
                                          fontSize:
                                              3 * SizeConfig.textMultiplier),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                      //: SizedBox(),
                      const SizedBox(height: kPadding),

                      BDOinputField(
                        controller: meetingController.subjectController,
                        textInputType: TextInputType.text,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                        maxLines: null,
                        hint: "Subject",
                        label: "Subject",
                      ),
                      const SizedBox(height: kPadding),
                      BDOinputField(
                        controller: meetingController.businessNameController,
                        textInputType: TextInputType.text,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                        maxLines: null,
                        hint: "Business Name",
                        label: "Business Name",
                      ),
                      const SizedBox(height: kPadding),
                      BDOinputField(
                        controller: meetingController.projectNameController,
                        textInputType: TextInputType.text,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                        maxLines: null,
                        hint: "Project Name",
                        label: "Project Name",
                      ),
                      const SizedBox(height: kPadding),
                      BDOinputField(
                        controller: meetingController.discriptionController,
                        textInputType: TextInputType.text,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                        maxLines: 6,
                        hint: "Discription",
                        label: "Discription",
                      ),

                      // BDOinputField(
                      //   controller: _meetinglinkController,
                      //   textInputType: TextInputType.text,
                      //   validator: (val) {},
                      //   maxLines: null,
                      //   hint: "Meeting Link",
                      //   label: "Meeting Link",
                      // ),
                      const SizedBox(height: kPadding * 2),
                      BDOmyButton(
                          width: SizeConfig.screenWidth,
                          color: widget.color,
                          label: "Create Meeting",
                          onTap: () {
                            if (showTime == "12:00 AM") {
                              Get.defaultDialog(
                                  title: 'Alert',
                                  content: Text('Please select date and time'),
                                  onConfirm: () {
                                    Get.back();
                                  },
                                  confirmTextColor: Colors.white);
                            } else if (key.currentState.validate()) {
                              meetingController.addMeeting(
                                businessName: meetingController
                                    .businessNameController.text,
                                clientId: widget.confirmClientModel.id,
                                meetingDate: formattedDate,
                                clientName:
                                    widget.confirmClientModel.clientName,
                                discription: meetingController
                                    .discriptionController.text,
                                projectName: meetingController
                                    .projectNameController.text,
                                subject:
                                    meetingController.subjectController.text,
                              );
                              Get.back();
                              Get.snackbar(
                                  'Success', 'Client Added Successfully');
                            } else {
                              return null;
                            }

                            //
                            //  print(confirmClientsController.confirmClient.length);
                          }),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 2,
                      )
                      //Text('hello',style: TextStyle(color: kLightTextColor),)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  // _pickDate() async {
  //   DateTime date = await showDatePicker(
  //     context: context,
  //     initialDate: pickedDate,
  //     firstDate: DateTime(DateTime.now().year - 5),
  //     lastDate: DateTime(DateTime.now().year + 5),
  //   );
  //   if (date != null) {
  //     setState(() {
  //       pickedDate = date;

  //       final DateFormat formatter = DateFormat('yyyy-MM-dd');
  //       formatted = formatter.format(pickedDate);
  //       print("Formated date $formatted");

  //       print("Picked date $pickedDate");
  //     });
  //   }
  // }

  // _pickTime() async {
  //   TimeOfDay t = await showTimePicker(
  //     context: context,
  //     initialTime: time,
  //   );
  //   if (t != null)
  //     setState(() {
  //       time = t;
  //       showTime = formatTimeOfDay(time);
  //       //vat  = DateFormat('kk:mm:a').format(time);
  //       print("my time is ${time.toString()}");
  //     });
  // }

// _pickDate() async {
//   DateTime date = await showDatePicker(
//     context: context,
//     initialDate: pickedDate,
//     firstDate: DateTime(DateTime.now().year - 5),
//     lastDate: DateTime(DateTime.now().year + 5),
//   );
//   if (date != null) {
//     setState(() {
//       pickedDate = date;
//     });
//   }
// }
}
