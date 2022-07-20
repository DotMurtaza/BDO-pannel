
import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_column_info.dart';
import 'package:bdo_pannel/models/BDO_clients_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants.dart';
import 'BDO_client_detail_screen.dart';

class BDOsavedClientInfoTiles extends StatelessWidget {
  const BDOsavedClientInfoTiles({
    Key key,
    this.info,
  }) : super(key: key);
  final BDOclientModels info;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => BDOsavedClientDescription(
              info: info,
            ));
      },
      child: Container(
        margin: EdgeInsets.only(
          top: kPadding / 2,
          left: kPadding / 1.5,
          right: kPadding / 1.5,
        ),
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: kPadding, bottom: kPadding / 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: kPadding * 1.2),
                    child: Column(
                      children: [
                        ColumnInfo(heading: "Client Name", text: info.name),
                      ],
                    ),
                  ),
                  Spacer(),
                  Align(
                      alignment: Alignment.centerRight,
                      child: PopupMenuButton(
                        itemBuilder: (context) => [
                          PopupMenuItem<String>(
                            child: Text("Delete"),
                            value: "del",
                          ),
                        ],
                        onSelected: (value) {},
                      )),
                ],
              ),
              ColumnInfo(heading: "Project", text: info.title),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    info.date,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontSize: 0.016 * SizeConfig.screenHeight),
                  ),
                  SizedBox(
                    width: 0.02 * SizeConfig.screenWidth,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
