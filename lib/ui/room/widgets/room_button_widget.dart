import 'package:hotel_app/consts/roomConsts/colors_consts.dart';
import 'package:hotel_app/consts/roomConsts/textstyle_consts.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/ui/booking/screens/booking_main_screen.dart';

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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const BookingMainScreen()));
        },
        child: const Text(
          'Выбрать номер',
          style: RoomTextStyles.buttonTitleTextStyle,
        ),
      ),
    );
  }
}
