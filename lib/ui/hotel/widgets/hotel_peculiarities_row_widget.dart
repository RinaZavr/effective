import 'package:hotel_app/utils/consts/hotelConsts/textstyle_consts.dart';
import 'package:flutter/material.dart';

class HotelPeculiaritiesRowWidget extends StatelessWidget {
  final List peculiarities;
  const HotelPeculiaritiesRowWidget({super.key, required this.peculiarities});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8,
      spacing: 28,
      children: [
        for (String text in peculiarities)
          Text(
            text,
            style: HotelTextStyles.aboutPeculiaritiesTextStyle,
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
