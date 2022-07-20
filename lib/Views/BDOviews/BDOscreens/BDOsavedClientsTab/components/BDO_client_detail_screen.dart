
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_details_info_row.dart';
import 'package:bdo_pannel/models/BDO_clients_model.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class BDOsavedClientDescription extends StatelessWidget {
  const BDOsavedClientDescription({
    Key key,
    this.info,
  }) : super(key: key);
  final BDOclientModels info;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Text(info.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Client Info",
              style: Theme.of(context).textTheme.headline6,
            ),
            BDOinfoRow(
              label: "Name",
              value: info.name,
            ),
            BDOinfoRow(
              label: "Mobile No.",
              value: info.phone.toString(),
            ),
            BDOinfoRow(
              label: "Email",
              value: info.email,
            ),
            BDOinfoRow(
              label: "Country",
              value: info.country,
            ),
            const SizedBox(height: kPadding * 1.5),
            Text(
              "Project Info",
              style: Theme.of(context).textTheme.headline6,
            ),
            BDOinfoRow(label: 'Project Name', value: info.title),
            BDOinfoRow(label: 'Type', value: info.type),
            BDOinfoRow(label: 'Source', value: info.source),
            BDOinfoRow(label: 'Cost', value: '\$${info.cost}'),
            SizedBox(
              height: kPadding,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Description:",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: Colors.grey[600]),
              ),
            ),
            SizedBox(height: kPadding * 0.25),
            Text(
              info.description,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
