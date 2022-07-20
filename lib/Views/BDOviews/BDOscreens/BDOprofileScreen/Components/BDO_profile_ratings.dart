import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BDOratingStar extends StatefulWidget {
  const BDOratingStar({
    Key key,
  }) : super(key: key);

  @override
  _BDOratingStarState createState() => _BDOratingStarState();
}

class _BDOratingStarState extends State<BDOratingStar> {
  double _rating = 3.5;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$_rating",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 0.035 * SizeConfig.screenHeight,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              " Rating",
              style: TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
        RatingBar.builder(
          initialRating: 3.5,
          minRating: 0.5,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
        ),
      ],
    );
  }
}
