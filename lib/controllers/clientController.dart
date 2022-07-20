import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/loading_Dialog.dart';
import 'package:bdo_pannel/controllers/auth_controller.dart';
import 'package:bdo_pannel/controllers/userController.dart';
import 'package:bdo_pannel/models/client_model.dart';
import 'package:bdo_pannel/models/confirm_client_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ClientController extends GetxController {
  Rx<List<ClientModel>> clientList = Rx<List<ClientModel>>();

  List<ClientModel> get client => clientList.value;
  final formKey = GlobalKey<FormState>();

  final firebaseFirestore = FirebaseFirestore.instance;
  final userController = Get.put(UserController());
  final nameController = TextEditingController();
  final businessController = TextEditingController();
  final cityNameController = TextEditingController();
  final clientContactController = TextEditingController();
  final clientEmailController = TextEditingController();
  final discriptionController = TextEditingController();
  final purposeController = TextEditingController();
  final RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();
  final projectCancelReasonController = TextEditingController();

  // @override
  // void onInit() {

  //   //confirmClientList.bindStream(confirmClientStream());
  //   super.onInit();
  // }
  void userClient() {
    print("get user ");
    clientList.bindStream(clientStream());
  }

  Stream<List<ClientModel>> clientStream() {
    print("enter in add function");
    return firebaseFirestore
        .collection('Users')
        .doc(userController.users.uid)
        .collection("Client")
        .orderBy('sentAt', descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ClientModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(ClientModel.fromSnapshot(element));
      });

      print('lenght is ${retVal.length}');
      return retVal;
    });
  }

  void cancelClientReason(String clientID) async {
    try {
      firebaseFirestore
          .collection('Users')
          .doc(userController.users.uid)
          .collection("Client")
          .doc(clientID)
          .update({
        'cancelReason': projectCancelReasonController.text,
        'status': 0
      }).then((value) {
        print("Client cancel");
        // Get.back();
      });
      Get.back();
    } catch (e) {
      print(e);
    }
  }

  void deleteClient(String clientId) {
    firebaseFirestore
        .collection("Users")
        .doc(userController.users.uid)
        .collection("Client")
        .doc(clientId)
        .update({'status': 0}).then((value) {
      print("clinet not confirmed");
    });
  }

  void conFirmedClient(String clientId) {
    try {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection("Users")
          .doc(userController.users.uid)
          .collection("Client")
          .doc(clientId);
      documentReference.get().then((data) {
        if (data.exists) {
          FirebaseFirestore.instance
              .collection("Users")
              .doc(userController.users.uid)
              .collection("ConfirmClient")
              .doc(clientId)
              .set({
            "documentReference": documentReference,
            "time": DateTime.now()
          }).then((value) {
            print("Client Confirm");
          });
        }
      });
    } catch (e) {}
  }

  Future<void> changeStatustoConfirm(String clientid) async {
    try {
      firebaseFirestore
          .collection("Users")
          .doc(userController.users.uid)
          .collection("Client")
          .doc(clientid)
          .update({"status": 1}).then((value) {
        print("Client confirm");
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void addClient() async {
    try {
      firebaseFirestore
          .collection("Users")
          .doc(userController.users.uid)
          .collection("Client")
          .get();

      await firebaseFirestore
          .collection('Users')
          .doc(userController.users.uid)
          .collection('Client')
          .add({
        'date': DateTime.now(),
        'sentAt': Timestamp.now(),
        'status': -1,
        'clientName': nameController.text,
        'clientBusiness': businessController.text,
        'clientCity': cityNameController.text,
        'clientContact': int.parse(clientContactController.text),
        'clientEmail': clientEmailController.text,
        'cancelReason': projectCancelReasonController.text,
        'discription': discriptionController.text,
      }).then((value) {
        btnController.stop();
        Get.snackbar("Client Added", "Client added Sucessfuly");
        clearController();
        Get.back();
        Get.back();

        // firebaseFirestore
        //     .collection('Users')
        //     .doc(userController.auth.currentUser.uid)
        //     .collection('Client')
        //     .doc(value.id);
        // print(value.id);
      }).catchError((e) {
        btnController.stop();
        Get.snackbar("Client not added", e.toString());
        clearController();
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  void findUserContactNumber(int clinetContactNumber) {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(userController.users.uid)
        .collection("Client")
        .where("clientContact", isEqualTo: clinetContactNumber)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        print("Client length is ${value.docs.length}");
        print(value.docs[0]["clientName"]);

        Get.defaultDialog(
            title: "Contact already exist",
            middleText:
                "This number is taken by ${value.docs[0]["clientName"]}",
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
              btnController.stop();
            });

        // return value.docs.length;
      } else if (formKey.currentState.validate()) {
        btnController.start();
        addClient();
      } else {
        btnController.stop();
      }
    });
  }

  void clearController() {
    nameController.clear();
    businessController.clear();
    cityNameController.clear();
    clientContactController.clear();
    clientEmailController.clear();
    discriptionController.clear();
  }
}
