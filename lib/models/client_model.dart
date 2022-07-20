import 'package:cloud_firestore/cloud_firestore.dart';

class ClientModel {
  String id;
  String clientName;
  String clientBusiness;
  //String purpose;
  String clientCity;
  int clientContact;
  String clientEmail;
  String discription;
  Timestamp time;
  int status;

  ClientModel(
      {this.clientName,
      this.clientBusiness,
      this.clientCity,
      this.clientContact,
      this.clientEmail,
        this.status,
      this.discription});
  ClientModel.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    clientName = snapshot.data()['clientName'] ?? "";
    clientBusiness = snapshot.data()['clientBusiness'] ?? "";
    clientCity = snapshot.data()['clientCity'] ?? "";
    clientContact = snapshot.data()['clientContact'];
    clientEmail = snapshot.data()['clientEmail'] ?? "";
    discription = snapshot.data()['discription'] ?? "";
    time = snapshot.data()['date'] ?? "";
    status = snapshot.data()['status'] ??0;
  }
}
