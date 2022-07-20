import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/models/BDO_all_projects_models.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';
import 'Components/BDO_cancelled_projects_description_tile.dart';

class BDOcancelledProjectScreen extends StatelessWidget {
  const BDOcancelledProjectScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFF6767),
        title: Text(
          "Cancelled Projects",
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(
            top: kPadding / 2, left: kPadding, right: kPadding),
        child: Column(
          children: [
            Container(
              height: SizeConfig.heightMultiplier*80,
              width: SizeConfig.screenWidth,
              child: ListView.builder(
                  itemCount: cancelled.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return BDOcancelledProjectDescriptionContainer(
                        cancel: cancelled[index]);
                  }),
            )
          ],
        ),
      )),
    );
  }
}
