import 'dart:io';

import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDObottomNavBar/BDO_bottom_nav_bar.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/SiginScreen/signin_screen.dart';
import 'package:bdo_pannel/Views/BDOviews/root.dart';
import 'package:bdo_pannel/controllers/clientController.dart';
import 'package:bdo_pannel/controllers/meeting_Controller.dart';
import 'package:bdo_pannel/models/DBO_user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class UserController extends GetxController {
  //final ClientController clientController = Get.put(ClientController());
  Rx<UserProfile> _userModel = UserProfile().obs;
  UserProfile get user => _userModel.value;
  set user(UserProfile value) => this._userModel.value = value;
  Rx<User> _firebaseUser = Rx<User>();
  User get users => _firebaseUser.value;

  final firebaseFirestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  File image;
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  String userToken;

  void clear() {
    _userModel.value = UserProfile();
  }

  @override
  void onInit() {
    _firebaseUser.bindStream(auth.authStateChanges());
    super.onInit();
  }

  getUser() async {
    try {
      DocumentSnapshot doc =
          await firebaseFirestore.collection('Users').doc(users.uid).get();
      user = UserProfile.fromSnapshot(doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      var _authResult = await auth
          .signInWithEmailAndPassword(email: email.trim(), password: password)
          .then((value) {
        getUser();

        Get.to(BDObottomNaveBar());
      });
    } catch (e) {
      Get.snackbar(
        "Error signing in",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signUP(String email, String password) async {
    var status = await OneSignal.shared.getDeviceState();
    String tokenID = status.userId;

    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      firebaseFirestore.collection("Users").doc(value.user.uid).set({
        "contact": "0307849598",
        "email": email,
        "image":
            "https://firebasestorage.googleapis.com/v0/b/dbo-management.appspot.com/o/user-images%2F9LLWwqUU1fM0aIuBW5xDjPrzjqy2?alt=media&token=474503d4-2ae2-42db-8abf-649b3e0673a7",
        "name": "Ali",
        "token": tokenID,
      });
    });
  }

  void signOut() async {
    try {
      await auth.signOut().then((value) {
        Get.to(Root());
      });
      // Get.find<UserController>().clear();
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<bool> updateUser(
      String name, String email, String contact, String uploadPic) async {
    try {
      final ref =
          FirebaseStorage.instance.ref().child('user-images').child(users.uid);
      await ref.putFile(image);
      final url = await ref.getDownloadURL();
      print('Url is: $url');
      await firebaseFirestore.collection('Users').doc(users.uid).update({
        'image': url ?? "",
        'name': name ?? "",
        'email': email ?? '',
        'contact': contact ?? '',
      }).then((value) {
        Get.put(UserController()).getUser();
        Get.back();
      });

      return true;
    } catch (e) {
      print(e);
      Get.snackbar('Error', e.toString());
      return false;
    }
  }
}
