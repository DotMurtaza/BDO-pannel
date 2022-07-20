import 'package:flutter/material.dart';

import '../../../constants.dart';

class BDOinfoRow extends StatelessWidget {
  const BDOinfoRow({
    Key key,
    @required this.label,
    @required this.value,
  }) : super(key: key);

  final String label, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: kPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: Colors.grey[600]),
          ),
          Text(
            value,

            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }
}
