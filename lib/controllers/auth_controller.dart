// import 'dart:io';

// import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDObottomNavBar/BDO_bottom_nav_bar.dart';
// import 'package:bdo_pannel/controllers/userController.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AuthController extends GetxController {
//   File image;
//   final emailTextController = TextEditingController();
//   final passwordTextController = TextEditingController();
//   FirebaseAuth auth = FirebaseAuth.instance;
//   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//   Rx<User> _firebaseUser = Rx<User>();

//   User get user => _firebaseUser.value;

//   @override
//   onInit() {
//     _firebaseUser.bindStream(auth.authStateChanges());

//     super.onInit();
//   }

//   void login(String email, String password) async {
//     try {
//       var _authResult = await auth
//           .signInWithEmailAndPassword(email: email.trim(), password: password)
//           .then((value) {
//         print(user.uid);
//         Get.to(BDObottomNaveBar());
//       });

//       // Get.find<UserController>().user =
//       // await Database().getUser(_authResult.user.uid);
//     } catch (e) {
//       Get.snackbar(
//         "Error signing in",
//         e.message,
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }

//   void signOut() async {
//     try {
//       await auth.signOut();
//       Get.find<UserController>().clear();
//     } catch (e) {
//       Get.snackbar(
//         "Error signing out",
//         e.toString(),
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }

//   Future<bool> updateUser(
//       String name, String email, String contact, String uploadPic) async {
//     try {
//       final ref =
//           FirebaseStorage.instance.ref().child('user-images').child(user.uid);
//       await ref.putFile(image);
//       final url = await ref.getDownloadURL();
//       print('Url is: $url');
//       await firebaseFirestore.collection('Users').doc(user.uid).update({
//         'image': url,
//         'name': name,
//         'email': email,
//         'contact': contact,
//       });
//       Get.back();
//       return true;
//     } catch (e) {
//       print(e);
//       Get.snackbar('Error', e.toString());
//       return false;
//     }
//   }

//   Future getUser() async {
//     try {
//       DocumentSnapshot doc =
//           await firebaseFirestore.collection('Users').doc(user.uid).get();
//       // var user= UserProfile.fromSnapshot(doc);
//       // return UserProfileModel.fromSnapshot(doc);
//     } catch (e) {
//       print(e);
//       rethrow;
//     }
//   }
// }
