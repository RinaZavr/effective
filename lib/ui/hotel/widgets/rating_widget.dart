import 'package:effective/consts/colors_consts.dart';
import 'package:effective/consts/textstyle_consts.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final int rating;
  const RatingWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.ratingBgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.star,
            color: AppColors.ratingContentColor,
            size: 17,
          ),
          Text(
            '$rating Превосходно',
            style: AppTextStyles.ratingTextStyle,
          )
        ],
      ),
    );
  }
}
