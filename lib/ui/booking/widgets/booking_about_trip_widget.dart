import 'package:flutter/material.dart';
import 'package:hotel_app/utils/consts/bookingConsts/list_consts.dart';
import 'package:hotel_app/utils/consts/bookingConsts/textstyle_consts.dart';
import 'package:hotel_app/domain/models/booking_model.dart';

class BookingAboutTripWidget extends StatelessWidget {
  final Booking booking;
  const BookingAboutTripWidget({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    List<String> tripValues = [
      booking.departure,
      booking.arrivalCountry,
      '${booking.tourDateStart} - ${booking.tourDateStop}',
      '${booking.numberOfNights} ночей',
      booking.hotelName,
      booking.room,
      booking.nutrition
    ];
    return Column(
      children: [
        for (int index = 0;
            index < BookingListConsts.tripTitleList.length;
            index++)
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
