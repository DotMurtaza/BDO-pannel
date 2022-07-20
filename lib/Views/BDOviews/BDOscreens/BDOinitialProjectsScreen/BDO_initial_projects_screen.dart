import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOaddNewProjectScreen/Add_new_client_screen.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOscreens/BDOcancelProjectReasonScreen/BDO_cancel_project_reason.dart';
import 'package:bdo_pannel/models/BDO_all_projects_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';
import 'Components/BDO_initial_project_description_tile.dart';

class BDOinitialProjectScreen extends StatelessWidget {
  const BDOinitialProjectScreen({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFAAD80),
        title: Text(
          "Initial Projects",
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(
          top: kPadding / 2,
        ),
        child: Column(
          children: [
            SizedBox(height: 0.01 * SizeConfig.screenHeight),
            Container(
              height: SizeConfig.heightMultiplier * 80,
              width: SizeConfig.screenWidth,
              child: ListView.builder(
                  itemCount: initial.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      secondaryActions: [
                        IconSlideAction(
                          caption: "Cancel",
                          color: Color(0xFFFF6767),
                          icon: Icons.cancel_presentation_sharp,
                          onTap: () {
                            Get.to(BDOcancelProjectPage(
                              color: Color(0xFFFAAD80),
                            ));
                          },
                        ),
                      ],
                      child: ListTile(
                        title: BDOinitialProjectDescriptionContainer(
                            initials: initial[index]),
                      ),
                    );
                  }),
            )
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddnewClientScreen());
        },
        backgroundColor: Color(0xFFFAAD80),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
