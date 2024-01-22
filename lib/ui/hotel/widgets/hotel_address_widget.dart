import 'package:hotel_app/utils/consts/hotelConsts/textstyle_consts.dart';
import 'package:flutter/material.dart';

class HotelAddressWidget extends StatelessWidget {
  final String title;
  const HotelAddressWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 12),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: HotelTextStyles.descriptionTextStyle,
          ),
        ),
        onPressed: (){},
      ),
    );
  }
}