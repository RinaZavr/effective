import 'package:effective/consts/hotelConsts/textstyle_consts.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final int price;
  final String priceForIt;
  const PriceWidget({super.key, required this.price, required this.priceForIt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: 'от $price ₽', style: HotelTextStyles.priceTextStyle),
          const TextSpan(text: '   '),
          TextSpan(text: priceForIt.toLowerCase(), style: HotelTextStyles.priceForItTextStyle),
        ]),
      ),
    );
  }
}
