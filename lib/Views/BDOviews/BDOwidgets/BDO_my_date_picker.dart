import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/controllers/BDO_main_controller.dart';
import 'package:bdo_pannel/controllers/meeting_Controller.dart';
import 'package:bdo_pannel/models/BDO_meetings_models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class BDOdateWidget extends StatelessWidget {
  BDOdateWidget({
    Key key,
    @required this.label,
    @required this.valueKey,
  }) : super(key: key);

  final String label, valueKey;
  final meetingController = Get.put(ClientMeetingController());
  //final _mainController = Get.find<BDOmainController>();

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
              DateFormat.yMMMMEEEEd().format(values[valueKey]),
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          const SizedBox(width: kPadding * 0.5),
          GestureDetector(
            onTap: () {
              _getDateFromUser(context, valueKey);
            },
            child: const Icon(
              Icons.calendar_today,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  _getDateFromUser(BuildContext context, String key) async {
    meetingController.pickDate = await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      initialDate: values[key],
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
    );
    if (meetingController.pickDate != null) {
      meetingController.updateValues(
          valueKey: key, value: meetingController.pickDate);
    }
  }
}
