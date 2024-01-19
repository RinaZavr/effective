import 'package:effective/consts/hotelConsts/colors_consts.dart';
import 'package:effective/consts/hotelConsts/textstyle_consts.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final int rating;
  final String ratingName;
  const RatingWidget({super.key, required this.rating, required this.ratingName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 250),
      width: 100,
      decoration: BoxDecoration(
        color: HotelColors.ratingBgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.star,
            color: HotelColors.ratingContentColor,
            size: 17,
          ),
          Text(
            '$rating $ratingName',
            style: HotelTextStyles.ratingTextStyle,
          )
        ],
      ),
    );
  }
}
