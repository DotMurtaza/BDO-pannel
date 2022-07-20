import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/controllers/BDO_main_controller.dart';
import 'package:bdo_pannel/controllers/meeting_Controller.dart';
import 'package:bdo_pannel/models/BDO_meetings_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class BDOtimeWidget extends StatelessWidget {
  BDOtimeWidget({
    Key key,
    @required this.label,
    @required this.valueKey,
  }) : super(key: key);

  final String label, valueKey;

//  final _mainController = Get.find<BDOmainController>();
  final meetingController = Get.find<ClientMeetingController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kPadding * 0.1,
      ),
      child: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: SizeConfig.widthMultiplier * 0.3,
            ),
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.grey),
            ),
          ),
          const Spacer(),
          GetBuilder<BDOmainController>(
            init: BDOmainController(),
            builder: (value) => Text(
              values[valueKey],
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const SizedBox(width: kPadding * 0.5),
          GestureDetector(
            onTap: () {
              _getTimeFromUser(context);
            },
            child: const Icon(
              Icons.watch_later,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  _getTimeFromUser(BuildContext context) async {
    meetingController.pickedTime = await _showTimePicker(context);
    String _formatedTime = meetingController.pickedTime.format(context);
    if (meetingController.pickedTime != null) {
      meetingController.updateValues(
        value: _formatedTime,
        valueKey: 'meeting_time',
      );
    }
  }

  _showTimePicker(context) async {
    return showTimePicker(
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
    );
  }
}
