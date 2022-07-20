import 'package:bdo_pannel/controllers/userController.dart';
import 'package:bdo_pannel/models/confirm_client_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class ConfirmClientsController extends GetxController {
  RxString clientName = "".obs;
  String clientBusiness;
  //String purpose;
  String clientCity;
  int clientContact;
  String clientEmail;
  String discription;
  Rx<List<ConfirmClientModel>> confirmClientList =
      Rx<List<ConfirmClientModel>>();
  List<ConfirmClientModel> get confirmClient => confirmClientList.value;
  Rx<List<ConfirmClientModel>> cancelClientList =
      Rx<List<ConfirmClientModel>>();

  List<ConfirmClientModel> get cancelClient => cancelClientList.value;
  final userController = Get.find<UserController>();

  // @override
  // void onInit() {
  //   //clientList.bindStream(clientStream());
  //   super.onInit();
  // }
  void userConfirmClients() {
    confirmClientList.bindStream(confirmClientStream());
    cancelClientList.bindStream(notConfirmClientStream());
  }

  Stream<List<ConfirmClientModel>> confirmClientStream() {
    print("enter in add function");
    return FirebaseFirestore.instance
        .collection('Users')
        .doc(userController.users.uid)
        .collection("Client")
        .where("status", isEqualTo: 1)
        //.orderBy('time', descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ConfirmClientModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(ConfirmClientModel.fromDocumentSnapShot(element));
      });

      print('lenght is ${retVal.length}');
      return retVal;
    });
  }

  Stream<List<ConfirmClientModel>> notConfirmClientStream() {
    print("enter in add function");
    return FirebaseFirestore.instance
        .collection('Users')
        .doc(userController.users.uid)
        .collection("Client")
        .where("status", isEqualTo: 0)
        //.orderBy('time', descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ConfirmClientModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(ConfirmClientModel.fromDocumentSnapShot(element));
      });

      print('lenght is ${retVal.length}');
      return retVal;
    });
  }
}
