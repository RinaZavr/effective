import 'package:hotel_app/utils/consts/roomConsts/textstyle_consts.dart';
import 'package:flutter/material.dart';

class RoomPeculiaritiesRowWidget extends StatelessWidget {
  final List peculiarities;
  const RoomPeculiaritiesRowWidget(
      {super.key, required this.peculiarities,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Wrap(
        runSpacing: 8,
        spacing: 28,
        children: [
            for(String text in peculiarities) Text(
              text,
              style: RoomTextStyles.peculiaritiesTextStyle,
              textAlign: TextAlign.center,
            ),
        ]
      ),
    );
  }
}
