import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/models/BDO_meetings_models.dart';
import 'package:bdo_pannel/models/meeting_Model.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../constants.dart';

class BDOmeetingDetailsPage extends StatefulWidget {
  final BDOmeetingsModels meeting;
  final MeetingModel meetingModel;
  final Color color;
  const BDOmeetingDetailsPage({Key key,  this.color, this.meetingModel, this.meeting})
      : super(key: key);

  @override
  _BDOmeetingDetailsPageState createState() => _BDOmeetingDetailsPageState();
}

class _BDOmeetingDetailsPageState extends State<BDOmeetingDetailsPage> {
  String splitTime;
  String splitDate;
  @override
  void initState() {
    splitTime=widget.meetingModel.meetingDate.split(" ").last;
    splitDate=widget.meetingModel.meetingDate.split(" ").first;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: widget.color,
          title: Text("Meeting Details"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kPadding,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: kPadding),
                Text(
                  "${widget.meetingModel.projectName.toUpperCase()}",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  'Attenders:',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text('${widget.meetingModel.clientName}'),
                const SizedBox(height: kPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Meeting Time:',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Text('${splitTime.split(".").first}'),
                  ],
                ),
                const SizedBox(height: kPadding),
                Text(
                  'Meeting Discussion: ',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                const SizedBox(height: kPadding * 0.45),
                Text(
                  widget.meetingModel.discription,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: kPadding * 2, horizontal: kPadding),
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [


                        Text(
                          "Meeting date",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                              fontSize: 0.02 * SizeConfig.screenHeight,
                              decoration: TextDecoration.underline),
                        ),
                        SizedBox(
                          width: 0.005 * SizeConfig.screenWidth,
                        ),
                        Text(
                          ' : $splitDate',
                          style: TextStyle(
                              fontSize: 0.02 * SizeConfig.screenHeight,
                              //decoration: TextDecoration.underline
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
