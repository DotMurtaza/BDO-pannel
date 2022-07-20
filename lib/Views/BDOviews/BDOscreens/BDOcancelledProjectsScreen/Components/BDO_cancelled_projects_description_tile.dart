import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOprojectsDetailsScreen/client_Information_Screen.dart';
import 'package:bdo_pannel/models/BDO_all_projects_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants.dart';

class BDOcancelledProjectDescriptionContainer extends StatelessWidget {
  const BDOcancelledProjectDescriptionContainer({
    Key key,
    @required this.cancel,
  }) : super(key: key);
  final BDOallProjectModels cancel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(BDOprojectDetailsScreen(
        //   notconfirmed: true,
        //   color: Color(0xFFFF6767),
        //   projecttitle: cancel.title,
        //   type: cancel.type,
        //   source: cancel.source,
        //   cost: cancel.cost,
        //   description: cancel.descriptiondetails,
        //   clientname: cancel.clientName,
        //   clientcontact: cancel.clientContact,
        //   clientEmail: cancel.clientEmail,
        //   clientCountry: cancel.clientCountry,
        // ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: kPadding),
        width: 0.9 * SizeConfig.screenWidth,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 03)]),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kPadding / 2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    cancel.title,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 0.01 * SizeConfig.screenHeight,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: kPadding / 6,
                            ),
                            child: GestureDetector(
                              onTap: () {},
                              child: Text("Delete"),
                            ),
                          ),
                          SizedBox(
                            height: 0.01 * SizeConfig.screenHeight,
                          ),
                        ],
                      ))
                    ],
                  )
                ],
              ),
              Text(
                cancel.description,
                style: TextStyle(
                  fontSize: 0.017 * SizeConfig.screenHeight,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade700,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  cancel.date,
                  style: TextStyle(
                      fontSize: 0.016 * SizeConfig.screenHeight,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
