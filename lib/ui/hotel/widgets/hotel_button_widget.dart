import 'package:hotel_app/utils/consts/hotelConsts/colors_consts.dart';
import 'package:hotel_app/utils/consts/hotelConsts/string_consts.dart';
import 'package:hotel_app/utils/consts/hotelConsts/textstyle_consts.dart';
import 'package:flutter/material.dart';

class HotelButtonWidget extends StatelessWidget {
  final String title;
  const HotelButtonWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: TextButton(
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.symmetric(vertical: 15),
            backgroundColor: HotelColors.buttonBgColor),
        onPressed: () {
          Navigator.pushNamed(context, '/room', arguments: {'title': title});
        },
        child: const Text(
          HotelStringConsts.buttonTitle,
          style: HotelTextStyles.buttonTitleTextStyle,
        ),
      ),
    );
  }
}
