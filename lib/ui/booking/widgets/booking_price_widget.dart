import 'package:flutter/material.dart';
import 'package:hotel_app/utils/consts/bookingConsts/list_consts.dart';
import 'package:hotel_app/utils/consts/bookingConsts/textstyle_consts.dart';

class BookingPriceWidget extends StatelessWidget {
  final int tourPrice;
  final int fuelCharge;
  final int serviceCharge;
  const BookingPriceWidget({super.key, required this.tourPrice, required this.fuelCharge, required this.serviceCharge});

  @override
  Widget build(BuildContext context) {
    List<int> priceValues = [
      tourPrice, fuelCharge, serviceCharge, tourPrice+fuelCharge+serviceCharge
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