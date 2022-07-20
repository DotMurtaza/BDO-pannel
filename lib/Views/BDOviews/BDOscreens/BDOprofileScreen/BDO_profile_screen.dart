import 'dart:io';

import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOeditProfileScreen/BDO_edit_profile_screen.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/SiginScreen/signin_screen.dart';
import 'package:bdo_pannel/controllers/userController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';
import 'Components/BDO_profile_ratings.dart';
import 'Components/BDO_profile_screen_row.dart';

class BDOprofileScreen extends StatefulWidget {
  const BDOprofileScreen({Key key, this.imagePickedFn}) : super(key: key);
  final void Function(File pickedFile) imagePickedFn;

  @override
  _BDOprofileScreenState createState() => _BDOprofileScreenState();
}

class _BDOprofileScreenState extends State<BDOprofileScreen> {
  final userController = Get.put(UserController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userController.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD6EEFA),
      body: GetX<UserController>(
          init: Get.put<UserController>(UserController()),
          builder: (UserController userController) {
            if (userController != null && userController.user != null) {
              //print('my user is:${profileController.user.firstName}');
              return SizedBox.expand(
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 0.02 * SizeConfig.screenHeight,
                      ),
                      Row(
                        children: [
                          Spacer(),
                          PopupMenuButton(
                            icon: Icon(
                              Icons.more_horiz,
                              size: 30,
                              color: Colors.grey[600],
                            ),
                            itemBuilder: (context) => [
                              PopupMenuItem<String>(
                                child: Text("Edit Profile"),
                                value: "editprofile",
                              ),
                            ],
                            onSelected: (value) {
                              if (value == "editprofile") {
                                Get.to(BDOeditProfile());
                              } else {}
                            },
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 0.20 * SizeConfig.screenHeight,
                            width: 0.40 * SizeConfig.screenWidth,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        userController.user.image ?? ' '),
                                    fit: BoxFit.cover),
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 3,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${userController.user.name}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      // SizedBox(
                      //   height: 0.01 * SizeConfig.screenHeight,
                      // ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: Column(
                            children: [
                              // SizedBox(
                              //   height: 0.03 * SizeConfig.screenHeight,
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 0.11 * SizeConfig.screenHeight,
                                      width: 0.8 * SizeConfig.screenWidth,
                                      child: BDOratingStar()),
                                ],
                              ),
                              // SizedBox(
                              //   height: 0.01 * SizeConfig.screenHeight,
                              // ),
                              Container(
                                height: 0.32 * SizeConfig.screenHeight,
                                width: 0.9 * SizeConfig.screenWidth,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[100],
                                          blurRadius: 6)
                                    ]),
                                child: Padding(
                                  padding: EdgeInsets.only(left: kPadding),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      BDOprofileScreenRow(
                                        name: 'Name',
                                        detail: '${userController.user.name}',
                                      ),
                                      Divider(),
                                      BDOprofileScreenRow(
                                        name: 'E-mail:',
                                        detail: '${userController.user.email}',
                                      ),
                                      Divider(),
                                      BDOprofileScreenRow(
                                        name: 'Contact:',
                                        detail:
                                            '${userController.user.contact}',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 0.02 * SizeConfig.screenHeight,
                              ),
                              FlatButton.icon(
                                  onPressed: () {
                                    userController.signOut();
                                  },
                                  icon: Icon(Icons.logout),
                                  label: Text(
                                    'Log Out',
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
