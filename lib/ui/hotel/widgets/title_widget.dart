import 'package:effective/consts/hotelConsts/textstyle_consts.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({super.key, required this.title});

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