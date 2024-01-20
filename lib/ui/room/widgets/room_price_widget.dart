import 'package:hotel_app/consts/roomConsts/textstyle_consts.dart';
import 'package:flutter/material.dart';

class RoomPriceWidget extends StatelessWidget {
  final int price;
  final String priceForIt;
  const RoomPriceWidget({super.key, required this.price, required this.priceForIt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: '$price ₽', style: RoomTextStyles.priceTextStyle),
          const TextSpan(text: '   '),
          TextSpan(text: priceForIt.toLowerCase(), style: RoomTextStyles.priceForItTextStyle),
        ]),
      ),
    );
  }
}
