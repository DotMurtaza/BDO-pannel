import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../../constants.dart';

class BDOupdateMeetingDiscussion extends StatelessWidget {
  const BDOupdateMeetingDiscussion({Key key, this.color}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    TextEditingController discussion = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text("Meeting Discussion"),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.keyboard_arrow_left)),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kPadding, vertical: kPadding),
            child: Container(
              height: 0.2 * SizeConfig.screenHeight,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPadding),
                child: TextFormField(
                  maxLines: 10,
                  keyboardType: TextInputType.text,
                  controller: discussion,
                  decoration: InputDecoration(
                      hintText: "Enter Discussion", border: InputBorder.none),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    MdiIcons.file,
                    size: 18,
                  ),
                  SizedBox(
                    width: 0.005 * SizeConfig.screenWidth,
                  ),
                  Text(
                    "Attach File",
                    style: TextStyle(
                        fontSize: 0.02 * SizeConfig.screenHeight,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: BDOmyButton(
                width: SizeConfig.screenWidth,
                label: "Update",
                onTap: () {},
                color: color),
          ),
          SizedBox(
            height: 0.02 * SizeConfig.screenHeight,
          )
        ],
      )),
    );
  }
}
