import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:flutter/material.dart';

class BDOmyDropDown extends StatefulWidget {
  const BDOmyDropDown({
    Key key,
    this.dropDownName,
    this.value1,
    this.value2,
    this.value3,
    this.value4,
  }) : super(key: key);

  final String dropDownName, value1, value2, value3, value4;
  @override
  _BDOmyDropDownState createState() => _BDOmyDropDownState();
}

class _BDOmyDropDownState extends State<BDOmyDropDown> {
  String projectsource = "";
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        widget.dropDownName,
        style: TextStyle(
            fontSize: 0.017 * SizeConfig.screenHeight,
            fontWeight: FontWeight.w300),
      ),
      Spacer(),
      Text(
        projectsource,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      PopupMenuButton(
        icon: Icon(Icons.arrow_downward),
        itemBuilder: (context) => [
          PopupMenuItem<String>(
            child: Text(
              widget.value1,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            value: "value1",
          ),
          PopupMenuItem<String>(
            child: Text(
              widget.value2,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            value: "value2",
          ),
          PopupMenuItem<String>(
            child: Text(
              widget.value3,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            value: "value3",
          ),
          PopupMenuItem<String>(
            child: Text(
              widget.value4,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            value: "value4",
          ),
        ],
        onSelected: (value) {
          if (value == "value1") {
            setState(() {
              projectsource = widget.value1;
            });
          }
          if (value == "value2") {
            setState(() {
              projectsource = widget.value2;
            });
          }
          if (value == "value3") {
            setState(() {
              projectsource = widget.value3;
            });
          }
          if (value == "value4") {
            setState(() {
              projectsource = widget.value4;
            });
          } else {}
        },
      )
    ]);
  }
}
