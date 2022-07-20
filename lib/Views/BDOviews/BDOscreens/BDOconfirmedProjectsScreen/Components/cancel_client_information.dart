import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_details_info_row.dart';
import 'package:bdo_pannel/models/confirm_client_model.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class CancelClientInformation extends StatelessWidget {
  CancelClientInformation({Key key, this.clientModel}) : super(key: key);
  final ConfirmClientModel clientModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF96BAFF),
          title: Text("Client Information"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kPadding,
            ),
            child: Column(
              children: [
                const SizedBox(height: kPadding),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     "Project Info.",
                //     style: Theme.of(context).textTheme.headline6,
                //   ),
                // ),
                BDOinfoRow(
                  label: "Name",
                  value: clientModel.clientName,
                ),
                BDOinfoRow(
                  label: "Email",
                  value: clientModel.clientEmail,
                ),
                BDOinfoRow(
                  label: "Contact Number",
                  value: clientModel.clientContact.toString(),
                ),
                BDOinfoRow(
                  label: "City",
                  value: clientModel.clientCity,
                ),
                BDOinfoRow(
                  label: "Business",
                  value: clientModel.clientBusiness,
                ),
                BDOinfoRow(
                  label: "Reason For cancel",
                  value: clientModel.cancelReason,
                ),
              ],
            ),
          ),
        ));
  }
}
