import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:flutter/material.dart';

class ColumnInfo extends StatelessWidget {
  const ColumnInfo({
    Key key,
    @required this.heading,
    @required this.text,
  }) : super(key: key);

  final String text, heading;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(color: Colors.grey),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SizedBox(height: 0.01 * SizeConfig.screenHeight),
      ],
    );
  }
}
