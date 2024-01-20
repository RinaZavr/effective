import 'package:hotel_app/consts/hotelConsts/colors_consts.dart';
import 'package:hotel_app/consts/hotelConsts/textstyle_consts.dart';
import 'package:flutter/material.dart';

class HotelRatingWidget extends StatelessWidget {
  final int rating;
  final String ratingName;
  const HotelRatingWidget({super.key, required this.rating, required this.ratingName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 250),
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
