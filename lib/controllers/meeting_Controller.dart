import 'package:bdo_pannel/controllers/userController.dart';
import 'package:bdo_pannel/models/BDO_meetings_models.dart';
import 'package:bdo_pannel/models/client_model.dart';
import 'package:bdo_pannel/models/meeting_Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientMeetingController extends GetxController {
  bool bdo = false, clients = false, teamMember = false;
  final subjectController = TextEditingController();
  final projectNameController = TextEditingController();
  final discriptionController = TextEditingController();
  final businessNameController = TextEditingController();
  Rx<List<MeetingModel>> clientMeetingList = Rx<List<MeetingModel>>();
  Rx<List<MeetingModel>> upcomingMeetingList = Rx<List<MeetingModel>>();
  Rx<List<MeetingModel>> individualClientMeetingList = Rx<List<MeetingModel>>();
  RxString valueKey = ''.obs;
  DateTime pickDate;
  var pickedTime;
  bool meetingTimeOver = false;
  void clear() {
    subjectController.clear();
    projectNameController.clear();
    discriptionController.clear();
    businessNameController.clear();
  }

  List<MeetingModel> get meetingList => clientMeetingList.value;
  List<MeetingModel> get upcomingList => clientMeetingList.value;
  List<MeetingModel> get indiviualMeetingList =>
      individualClientMeetingList.value;
  final firebaseFirestore = FirebaseFirestore.instance;
  final userController = Get.put(UserController());

  // @override
  // void onInit() {

  //   super.onInit();
  // }
  void clientMeeting() {
    clientMeetingList.bindStream(allMeetingStream());
  }

  void getIndividualMeeting(String id) {
    individualClientMeetingList.bindStream(individualClientStream(id));
  }

  void getUpcomingMeeting() {
    upcomingMeetingList.bindStream(upcomingMeetingStream());
  }

  Stream<List<MeetingModel>> individualClientStream(String id) {
    print("enter in add function");
    return firebaseFirestore
        .collection('Users')
        .doc(userController.users.uid)
        .collection("Meetings")
        .where('clientId', isEqualTo: id)
        // .orderBy("meetingDate", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<MeetingModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(MeetingModel.fromDocumentSnapshot(element));
      });

      print('Length is ${retVal.length}');
      return retVal;
    });
  }

  Stream<List<MeetingModel>> allMeetingStream() {
    print("enter in add function ${userController.users.uid}");
    return firebaseFirestore
        .collection('Users')
        .doc(userController.users.uid)
        .collection("Meetings")
        .orderBy('meetingDate', descending: false)
        .snapshots()
        .map((QuerySnapshot query) {
      List<MeetingModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(MeetingModel.fromDocumentSnapshot(element));
      });

      print('Length is ${retVal.length}');
      return retVal;
    });
  }

  Stream<List<MeetingModel>> upcomingMeetingStream() {
    print("enter in add function");
    return firebaseFirestore
        .collection('Users')
        .doc(userController.users.uid)
        .collection("Meetings")
        .orderBy("meetingTime", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<MeetingModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(MeetingModel.fromDocumentSnapshot(element));
      });

      print('Length is ${retVal.length}');
      return retVal;
    });
  }

  void updateDropdownValue(String key, String newValue) {
    dropDownData[key]['value'] = newValue;
    update();
  }

  void updateValues({dynamic value, String valueKey}) {
    values[valueKey] = value;
    update();
  }

  Future<void> addMeeting({
    String clientId,
    String meetingDate,
    String clientName,
    String projectName,
    String subject,
    String discription,
    String businessName,
  }) async {
    try {
      await firebaseFirestore
          .collection('Users')
          .doc(userController.users.uid)
          .collection('Meetings')
          .add({
        'sentAt': Timestamp.now(),
        'clientId': clientId,
        'meetingDate': meetingDate ?? "",
        'clientName': clientName ?? "",
        'projectName': projectName ?? "",
        'meetingSub': subject ?? "",
        'discription': discription ?? "",
        'businessName': businessName ?? "",
        "notification": 0,
      }).then((value) {
        clear();
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
