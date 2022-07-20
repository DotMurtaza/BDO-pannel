import 'package:cloud_firestore/cloud_firestore.dart';

class MeetingModel {
  String clientId;

  String meetingTime;
  String clientName;
  String projectName;
  String meetingDate;
  String subject;
  String discription;
  String businessName;
  String id;
  int notification;

  MeetingModel(
      {this.clientId,
      this.discription,
      this.meetingDate,
      this.meetingTime,
      this.clientName,
      this.businessName,
      this.projectName,
      this.subject});

  MeetingModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    clientId = snapshot.data()['clientId'];

    meetingTime = snapshot.data()['meetingTime'];
    clientName = snapshot.data()['clientName'];
    projectName = snapshot.data()['projectName'];
    meetingDate = snapshot.data()['meetingDate'];
    subject = snapshot.data()['subject'];
    discription = snapshot.data()['discription'];
    businessName = snapshot.data()['businessName'];
    notification = snapshot.data()["notification"];
  }
}
