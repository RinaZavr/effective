import 'package:flutter/material.dart';
import 'package:hotel_app/ui/hotel/widgets/hotel_address_widget.dart';
import 'package:hotel_app/ui/hotel/widgets/hotel_rating_widget.dart';
import 'package:hotel_app/ui/hotel/widgets/hotel_title_widget.dart';

class BookingAboutHotelWidget extends StatelessWidget {
  const BookingAboutHotelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HotelRatingWidget(rating: 5, ratingName: 'Превосходно'),
          HotelTitleWidget(title: 'Steigenberger Makadi'),
          HotelAddressWidget(title: 'Madinat Makadi, Safaga Road, Makadi Bay, Египет')
        ],
      ),
    );
  }
}