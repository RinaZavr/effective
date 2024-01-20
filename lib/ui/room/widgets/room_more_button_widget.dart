import 'package:hotel_app/consts/roomConsts/colors_consts.dart';
import 'package:hotel_app/consts/roomConsts/textstyle_consts.dart';
import 'package:flutter/material.dart';

class RoomMoreButtonWidget extends StatelessWidget {
  final String title;
  const RoomMoreButtonWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      child: Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: RoomTextStyles.moreButtonTitleTextStyle,
            ),
          ),
          const Icon(Icons.arrow_forward_ios_rounded,
              color: RoomColors.moreButtonColor, size: 20),
        ],
      ),
      onPressed: () {},
    );
  }
}
