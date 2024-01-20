import 'package:hotel_app/consts/hotelConsts/textstyle_consts.dart';
import 'package:flutter/material.dart';

class HotelPeculiaritiesRowWidget extends StatelessWidget {
  final String textFirst;
  final String textSecond;
  const HotelPeculiaritiesRowWidget(
      {super.key, required this.textFirst, required this.textSecond});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Text(
          textFirst,
          style: HotelTextStyles.aboutPeculiaritiesTextStyle,
          textAlign: TextAlign.center,
        )),
        const SizedBox(
          width: 28,
        ),
        Expanded(
            child: Text(
          textSecond,
          style: HotelTextStyles.aboutPeculiaritiesTextStyle,
          textAlign: TextAlign.center,
        )),
      ],
    );
  }
}
