
import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_my_date_picker.dart';
import 'package:bdo_pannel/models/BDO_meetings_models.dart';
import 'package:flutter/material.dart';

import 'Components/BDO_confirmed_not_updated_tile.dart';

class BDOConfirmedNotUpdatedTab extends StatelessWidget {
  const BDOConfirmedNotUpdatedTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 0.01 * SizeConfig.screenHeight),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 0.04 * SizeConfig.screenWidth),
              child: BDOdateWidget(
                label: 'Select Date',
                valueKey: 'meeting_date',
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: meetings.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BDOConfirmedNotUpdatedTile(
                    meet: meetings[index],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
