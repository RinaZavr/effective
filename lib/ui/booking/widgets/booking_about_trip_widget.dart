import 'package:flutter/material.dart';
import 'package:hotel_app/consts/bookingConsts/list_consts.dart';
import 'package:hotel_app/consts/bookingConsts/textstyle_consts.dart';

class BookingAboutTripWidget extends StatelessWidget {
  const BookingAboutTripWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> tripValues = [
      'Санкт-Петербург',
      'Египет, Хургада',
      '19.09.2023 – 27.09.2023',
      '7 ночей',
      'Steigenberger Makadi',
      'Стандартный с видом на бассейн или сад',
      'Все включено'
    ];
    return Column(
      children: [
        for(int index = 0; index < BookingListConsts.tripTitleList.length; index++)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  BookingListConsts.tripTitleList[index],
                  style: BookingTextStyles.tripTitleTextStyle,
                ),
              ),
              Expanded(
                child: Text(
                  tripValues[index],
                  style: BookingTextStyles.tripValueTextStyle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
