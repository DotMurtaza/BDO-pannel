import 'package:bdo_pannel/models/BDO_meetings_models.dart';
import 'package:flutter/material.dart';
import 'Components/BDO_confirmed_up_coming_tile.dart';
class BDOConfirmedUpComingTab extends StatelessWidget {
  const BDOConfirmedUpComingTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: meetings.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BDOConfirmedUpComingTile(
                    meet: meetings[index],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
