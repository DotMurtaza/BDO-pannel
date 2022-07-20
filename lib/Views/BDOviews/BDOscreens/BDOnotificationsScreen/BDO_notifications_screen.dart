import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/models/BDO_notifications_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import 'Components/BDO_notifications_tile.dart';

class BDOnotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding / 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Mark all as read",
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.w600),
                ),
              ),
              Divider(),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: notification.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => BDOnotifications(
                          index: index,
                          notify: notification[index],
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: SizedBox(),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        "Notifications",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: kPadding / 2),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 0.05 * SizeConfig.screenHeight,
              width: 0.10 * SizeConfig.screenWidth,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Entypo.cancel,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
