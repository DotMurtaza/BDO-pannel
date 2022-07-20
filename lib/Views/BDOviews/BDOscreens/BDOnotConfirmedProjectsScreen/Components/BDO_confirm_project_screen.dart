
import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_input_field.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_my_button.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_my_date_picker.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_my_drop_down.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';


class BDOconfirmProjectPage extends StatefulWidget {
  const BDOconfirmProjectPage({
    Key key,
  });
  @override
  _BDOconfirmProjectPageState createState() => _BDOconfirmProjectPageState();
}

class _BDOconfirmProjectPageState extends State<BDOconfirmProjectPage> {
  final _costController = TextEditingController();
  int _groupvalue = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF96BAFF),
          title: Text("Confirm Project"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: SingleChildScrollView(
            child: Container(
              height: SizeConfig.heightMultiplier*90,
              width: SizeConfig.widthMultiplier*90,
              child: Column(
                //scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(height: kPadding-4),
                  Row(
                    children: [
                      // Expanded(
                      //   child: RadioListTile(
                      //       value: 0,
                      //       activeColor: notConfirmedColor,
                      //       groupValue: _groupvalue,
                      //       title: Text("Project Based"),
                      //       onChanged: (value) {
                      //         setState(() {
                      //           _groupvalue = value;
                      //         });
                      //       }),
                      // ),
                      // Expanded(
                      //   child: RadioListTile(
                      //
                      //       value: 1,
                      //       activeColor: notConfirmedColor,
                      //       groupValue: _groupvalue,
                      //       title: Text("Hourly Based"),
                      //       onChanged: (value) {
                      //         setState(() {
                      //           _groupvalue = value;
                      //         });
                      //       }),
                      // )
                    ],
                  ),
                  BDOmyDropDown(
                    dropDownName: "Deleivery Point",
                    value1: "Fiverr",
                    value2: "Upwork",
                    value3: "Guru",
                    value4: "Other Payment Method",
                  ),
                  const SizedBox(height: kPadding * 0.25),
                  BDOmyDropDown(
                    dropDownName: "Currency",
                    value1: "USD",
                    value2: "EUR",
                    value3: "PKR",
                    value4: "AED",
                  ),
                  BDOinputField(
                    controller: _costController,
                    textInputType: TextInputType.number,
                    maxLines: 1,
                    validator: (value) {},
                    hint: _groupvalue == 1 ? "Per Hour Cost" : "Cost",
                    label: _groupvalue == 1 ? "Per Hour Cost" : "Cost",
                  ),
                  const SizedBox(height: kPadding),
                  BDOdateWidget(label: 'Start Date', valueKey: 'project_start_date'),
                  const SizedBox(height: kPadding),
                  BDOdateWidget(label: 'End Date', valueKey: 'project_end_date'),
                  const Spacer(),
                  BDOmyButton(
                      width: SizeConfig.screenWidth,
                      label: "Confirm Project",
                      onTap: () {},
                      color: Color(0xFF96BAFF)),
                  const SizedBox(height: kPadding * 2),
                ],
              ),
            ),
          ),
        ));
  }
}
