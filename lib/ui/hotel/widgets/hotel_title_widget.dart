import 'package:hotel_app/consts/hotelConsts/textstyle_consts.dart';
import 'package:flutter/material.dart';

class HotelTitleWidget extends StatelessWidget {
  final String title;
  const HotelTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Text(
        title,
        style: HotelTextStyles.titleTextStyle,
      ),
    );
  }
}