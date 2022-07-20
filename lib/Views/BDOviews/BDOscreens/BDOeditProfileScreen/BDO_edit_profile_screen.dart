import 'dart:io';

import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_input_field.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_my_button.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/loading_Dialog.dart';
import 'package:bdo_pannel/controllers/userController.dart';
import 'package:bdo_pannel/models/DBO_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants.dart';

class BDOeditProfile extends StatefulWidget {
  @override
  _BDOeditProfileState createState() => _BDOeditProfileState();
}

final myUserController = Get.put<UserController>(UserController());

class _BDOeditProfileState extends State<BDOeditProfile> {
  TextEditingController editname =
      TextEditingController(text: myUserController.user.name);

  TextEditingController editmail =
      TextEditingController(text: myUserController.users.email);

  TextEditingController editnumber =
      TextEditingController(text: myUserController.user.contact);

  TextEditingController editdob = TextEditingController(text: '30-01-2001');

  //final authController=Get.put<AuthController>(AuthController());

  final picker = ImagePicker();
  UserProfile userProfile;

  // _BDOeditProfileState(this.userProfile);

  Future getImage() async {
    final pickedImage =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 20);

    setState(() {
      if (pickedImage != null) {
        myUserController.image = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
    File(pickedImage.path);
  }

  final editkey = GlobalKey<FormState>();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 30,
            ),
          ),
          title: Text('Edit Profile', style: TextStyle(fontSize: 22)),
        ),
        body: GetX<UserController>(
            init: Get.put<UserController>(UserController()),
            builder: (UserController userController) {
              if (userController != null && userController.user != null) {
                //print('my user is:${profileController.user.firstName}');
                return Form(
                  key: editkey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: kPadding),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Stack(
                              children: [
                                Container(
                                  height: 0.20 * SizeConfig.screenHeight,
                                  width: 0.40 * SizeConfig.screenWidth,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: userController.image != null
                                              ? FileImage(userController.image)
                                              : NetworkImage(
                                                  userController.user.image),
                                          fit: BoxFit.cover),
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: SizeConfig.heightMultiplier * 2,
                                ),
                                Positioned(
                                  bottom: 3,
                                  right: 3,
                                  child: Container(
                                    height: 0.05 * SizeConfig.screenHeight,
                                    width: 0.10 * SizeConfig.screenWidth,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kPrimaryColor,
                                    ),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.add_a_photo_rounded,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        onPressed: getImage),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 0.05 * SizeConfig.screenHeight,
                          ),
                          BDOinputField(
                            controller: editname,
                            maxLines: 1,
                            textInputType: TextInputType.name,
                            validator: (value) {},
                            hint: 'Enter your name',
                            label: 'Name',
                            labelcolor: Colors.black,
                          ),
                          SizedBox(
                            height: 0.03 * SizeConfig.screenHeight,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.snackbar('Alert', "Email Can't be changed");
                            },
                            child: BDOinputField(
                              enable: false,
                              controller: editmail,
                              maxLines: 1,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {},
                              hint: 'Enter your E-mail',
                              label: 'E-mail',
                              labelcolor: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 0.03 * SizeConfig.screenHeight,
                          ),
                          BDOinputField(
                            controller: editnumber,
                            maxLines: 1,
                            textInputType: TextInputType.number,
                            validator: (value) {},
                            hint: 'Enter your phone number',
                            label: 'Phone number',
                            labelcolor: Colors.black,
                          ),
                          SizedBox(
                            height: 0.08 * SizeConfig.screenHeight,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BDOmyButton(
                                  label: 'Save changes',
                                  onTap: () {
                                    showLoading();
                                    userController
                                        .updateUser(
                                            editname.text,
                                            editmail.text,
                                            editnumber.text,
                                            '${userController.image}')
                                        .then((value) {
                                      Get.back();
                                    });

                                    // userController.getUser();
                                  },
                                  color: kPrimaryColor,
                                  width: 0.40 * SizeConfig.screenWidth)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
