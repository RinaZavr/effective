import 'package:hotel_app/consts/roomConsts/textstyle_consts.dart';
import 'package:flutter/material.dart';

class RoomPeculiaritiesRowWidget extends StatelessWidget {
  final String textFirst;
  final String textSecond;
  const RoomPeculiaritiesRowWidget(
      {super.key, required this.textFirst, required this.textSecond});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              textFirst,
              style: RoomTextStyles.peculiaritiesTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            width: 28,
          ),
          Expanded(
            child: Text(
              textSecond,
              style: RoomTextStyles.peculiaritiesTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
