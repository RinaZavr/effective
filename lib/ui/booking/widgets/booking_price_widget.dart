import 'package:flutter/material.dart';
import 'package:hotel_app/consts/bookingConsts/list_consts.dart';
import 'package:hotel_app/consts/bookingConsts/textstyle_consts.dart';

class BookingPriceWidget extends StatelessWidget {
  const BookingPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> priceValues = [
      289400, 9300, 2150, 289400+9300+2150
    ];
    return Column(
      children: [
        for(int index = 0; index < BookingListConsts.priceTitleList.length; index++)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  BookingListConsts.priceTitleList[index],
                  style: BookingTextStyles.priceTitleTextStyle,
                ),
              ),
              Expanded(
                child: Text(
                  priceValues[index].toString(),
                  style: BookingTextStyles.priceValueTextStyle,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}