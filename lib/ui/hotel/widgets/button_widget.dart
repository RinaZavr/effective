import 'package:effective/consts/hotelConsts/colors_consts.dart';
import 'package:effective/consts/hotelConsts/textstyle_consts.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          backgroundColor: HotelColors.buttonBgColor
        ),
        onPressed: () {},
        child: const Text('К выбору номера', style: HotelTextStyles.buttonTitleTextStyle,),
      ),
    );
  }
}
