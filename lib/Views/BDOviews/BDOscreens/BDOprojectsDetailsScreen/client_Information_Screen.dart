import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_details_info_row.dart';
import 'package:bdo_pannel/models/client_model.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';

class ClientInformation extends StatelessWidget {
  final ClientModel clientModel;

  ClientInformation({this.clientModel});

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
                  label: "Description",
                  value: '',
                ),
                SizedBox(height: 3,),
                Text(
                  '${clientModel.discription}',
                  style: TextStyle(fontSize: 15),
                )

                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     "Description:",
                //     style: Theme.of(context)
                //         .textTheme
                //         .bodyText2
                //         .copyWith(color: Colors.grey[600]),
                //   ),
                // ),
                // const SizedBox(height: kPadding * 0.25),
                // Text(
                //   description,
                //   style: Theme.of(context).textTheme.subtitle1,
                // ),
                // const SizedBox(height: kPadding * 1.5),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     "Client Info.",
                //     style: Theme.of(context).textTheme.headline6,
                //   ),
                // ),
                // BDOinfoRow(
                //   label: "Name",
                //   value: clientname,
                // ),
                // BDOinfoRow(
                //   label: "Mobile No.",
                //   value: clientcontact.toString(),
                // ),
                // BDOinfoRow(
                //   label: "Email",
                //   value: clientEmail,
                // ),
                // BDOinfoRow(
                //   label: "Country",
                //   value: clientCountry,
                // ),
                // const SizedBox(height: kPadding * 1.5),
              ],
            ),
          ),
        ));
  }
}
