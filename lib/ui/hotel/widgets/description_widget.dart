import 'package:effective/consts/hotelConsts/textstyle_consts.dart';
import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String title;
  const DescriptionWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: TextButton(
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