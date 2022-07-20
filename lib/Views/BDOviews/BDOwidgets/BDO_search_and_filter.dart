import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BDOSearchAndFilter extends StatelessWidget {
  const BDOSearchAndFilter({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 0.06 * SizeConfig.screenHeight,
          width: 0.95 * SizeConfig.screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.grey),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    FontAwesomeIcons.search,
                    size: 15,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'Search here',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.grey)),
            ),
          ),
        ),
      ],
    );
  }
}
