import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_input_field.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_my_button.dart';
import 'package:bdo_pannel/controllers/clientController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';

class BDOcancelProjectPage extends StatelessWidget {
  BDOcancelProjectPage({Key key, this.color, this.clientId});
  final String clientId;

  final Color color;
  final GlobalKey<FormState> _key = GlobalKey();
  final clientController = Get.put(ClientController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: color,
        title: Text("Cancel Project"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kPadding,
        ),
        child: Form(
          key: _key,
          child: Column(
            children: [
              const SizedBox(height: kPadding),
              BDOinputField(
                controller: clientController.projectCancelReasonController,
                textInputType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter any reason";
                  } else {
                    return null;
                  }
                },
                maxLines: null,
                label: "Reason",
                hint: "Reason",
              ),
              const Spacer(),
              BDOmyButton(
                  width: SizeConfig.screenWidth,
                  label: "Cancel Project",
                  onTap: () {
                    if (_key.currentState.validate()) {
                      clientController.cancelClientReason(clientId);
                      Get.snackbar("Alert", 'Client Cancel SuccessFully');
                      clientController.projectCancelReasonController.clear();
                    }
                  },
                  color: color),
              const SizedBox(height: kPadding * 2),
            ],
          ),
        ),
      ),
    );
  }
}
