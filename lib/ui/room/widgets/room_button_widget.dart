import 'package:hotel_app/utils/consts/roomConsts/colors_consts.dart';
import 'package:hotel_app/utils/consts/roomConsts/string_consts.dart';
import 'package:hotel_app/utils/consts/roomConsts/textstyle_consts.dart';
import 'package:flutter/material.dart';

class RoomButtonWidget extends StatelessWidget {
  final Size size;
  const RoomButtonWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: TextButton(
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            fixedSize: Size(size.width, 50),
            padding: const EdgeInsets.symmetric(vertical: 15),
            backgroundColor: RoomColors.selectButtonBgColor),
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/booking',
          );
        },
        child: const Text(
          RoomStringConsts.buttonSelectTitle,
          style: RoomTextStyles.buttonTitleTextStyle,
        ),
      ),
    );
  }
}
