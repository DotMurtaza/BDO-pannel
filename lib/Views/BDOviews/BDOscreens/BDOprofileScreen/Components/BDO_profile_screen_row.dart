import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:flutter/material.dart';

class BDOprofileScreenRow extends StatelessWidget {
  const BDOprofileScreenRow({
    Key key,
    this.name,
    this.detail,
  }) : super(key: key);
  final String name;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: Colors.grey[600]),
        ),
        SizedBox(
          height: 0.01 * SizeConfig.screenHeight,
        ),
        Text(
          detail,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }
}
