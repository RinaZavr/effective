import 'package:flutter/material.dart';
import 'package:hotel_app/ui/hotel/widgets/hotel_address_widget.dart';
import 'package:hotel_app/ui/hotel/widgets/hotel_rating_widget.dart';
import 'package:hotel_app/ui/hotel/widgets/hotel_title_widget.dart';

class BookingAboutHotelWidget extends StatelessWidget {
  final String name;
  final String adress;
  final int rating;
  final String ratingName;

  const BookingAboutHotelWidget({super.key, required this.name, required this.adress, required this.rating, required this.ratingName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HotelRatingWidget(rating: rating, ratingName: ratingName),
          HotelTitleWidget(title: name),
          HotelAddressWidget(title: adress)
        ],
      ),
    );
  }
}