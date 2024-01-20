import 'package:hotel_app/consts/roomConsts/textstyle_consts.dart';
import 'package:flutter/material.dart';

class RoomTitleWidget extends StatelessWidget {
  final String title;
  const RoomTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Text(
        title,
        style: RoomTextStyles.titleTextStyle,
      ),
    );
  }
}