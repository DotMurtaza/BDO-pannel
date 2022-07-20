import 'package:bdo_pannel/controllers/confirmed_Clinets_Controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ConfirmClientModel {
  // final ConfirmClientsController confirmClientsController =
  //     Get.put(ConfirmClientsController());

  String id;
  String clientName;
  String clientBusiness;
  String cancelReason;

  //String purpose;
  String clientCity;
  int clientContact;
  String clientEmail;
  String discription;

  //RxTimestamp time;

  // DocumentReference documentReference;

  ConfirmClientModel(
      {
      //this.documentReference,
      this.cancelReason,
      this.id,
      this.clientName,
      this.clientBusiness,
      this.clientCity,
      this.clientContact,
      this.clientEmail,
      this.discription});

  ConfirmClientModel.fromDocumentSnapShot(DocumentSnapshot data) {
    id = data.id;
    clientName = data.data()["clientName"] ?? "";
    clientBusiness = data.data()['clientBusiness'] ?? "";
    clientCity = data.data()['clientCity'] ?? "";
    clientContact = data.data()['clientContact'] ?? "";
    clientEmail = data.data()['clientEmail'] ?? "";
    discription = data.data()['discription'] ?? "";
    cancelReason = data.data()['cancelReason'] ?? "";
    // documentReference = data.data()["documentReference"] ?? "";
    //documentReference.get().then((value) {

    //});

    //print("document Referance is $documentReference");
  }
}
