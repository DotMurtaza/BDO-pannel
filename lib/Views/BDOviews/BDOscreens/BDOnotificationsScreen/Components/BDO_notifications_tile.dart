import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/models/BDO_notifications_model.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import 'BDO_notifications_buttons.dart';

class BDOnotifications extends StatelessWidget {
  const BDOnotifications({
    Key key,
    this.notify,
    this.index,
  }) : super(key: key);
  final BDOnotificationModel notify;
  final int index;

  @override
  Widget build(BuildContext context) {
    int selectedindex = 0;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: kPadding / 2),
              height: 0.07 * SizeConfig.screenHeight,
              width: 0.15 * SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200, shape: BoxShape.circle),
              child: Icon(
                Icons.person,
                color: kPrimaryColor,
              ),
            ),
            Container(
              height: 0.12 * SizeConfig.screenHeight,
              width: 0.75 * SizeConfig.screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notify.notification,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        notify.time,
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      selectedindex == index
                          ? Row(
                              children: [
                                Icon(
                                  Icons.alarm,
                                  size: 17,
                                  color: kPrimaryColor,
                                ),
                                SizedBox(width: 0.01 * SizeConfig.screenWidth),
                                Text(
                                  '30 minutes left',
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          : SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 0.01 * SizeConfig.screenHeight),
        Row(
          children: [
            SizedBox(
              width: 0.31 * SizeConfig.screenWidth,
            ),
            BDOacceptDeclineButton(
              title: 'Accept',
              color: kPrimaryColor,
              titlecolor: Colors.white,
            ),
            SizedBox(width: 0.02 * SizeConfig.screenWidth),
            BDOacceptDeclineButton(
              title: 'Decline',
              color: Colors.grey.shade200,
              titlecolor: Colors.black,
            ),
          ],
        ),
        SizedBox(
          height: 0.005 * SizeConfig.screenHeight,
        ),
        Divider(),
      ],
    );
  }
}
