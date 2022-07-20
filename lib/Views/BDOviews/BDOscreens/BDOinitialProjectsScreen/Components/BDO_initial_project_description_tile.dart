import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOprojectsDetailsScreen/client_Information_Screen.dart';
import 'package:bdo_pannel/models/BDO_all_projects_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants.dart';

class BDOinitialProjectDescriptionContainer extends StatelessWidget {
  const BDOinitialProjectDescriptionContainer({
    Key key,
    @required this.initials,
  }) : super(key: key);
  final BDOallProjectModels initials;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(BDOprojectDetailsScreen(
        //   notconfirmed: true,
        //   color: Color(0xFFFAAD80),
        //   projecttitle: initials.title,
        //   type: initials.type,
        //   source: initials.source,
        //   cost: initials.cost,
        //   description: initials.descriptiondetails,
        //   clientname: initials.clientName,
        //   clientcontact: initials.clientContact,
        //   clientEmail: initials.clientEmail,
        //   clientCountry: initials.clientCountry,
        // ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: kPadding / 2),
        width: 0.9 * SizeConfig.screenWidth,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 03)]),
        child: Padding(
          padding: const EdgeInsets.only(
              left: kPadding / 2, right: kPadding / 2, top: kPadding / 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                initials.title,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 0.01 * SizeConfig.screenHeight,
              ),
              Text(
                initials.description,
                style: TextStyle(
                  fontSize: 0.017 * SizeConfig.screenHeight,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(
                height: 0.005 * SizeConfig.screenHeight,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  initials.date,
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
