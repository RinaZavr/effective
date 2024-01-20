import 'package:flutter/material.dart';
import 'package:hotel_app/consts/bookingConsts/textstyle_consts.dart';
import 'package:hotel_app/ui/booking/widgets/booking_about_buyer_widget.dart';
import 'package:hotel_app/ui/booking/widgets/booking_about_hotel_widget.dart';
import 'package:hotel_app/ui/booking/widgets/booking_about_trip_widget.dart';
import 'package:hotel_app/ui/booking/widgets/booking_tourist_list_widget.dart';

class BookingMainScreen extends StatefulWidget {
  const BookingMainScreen({super.key});

  @override
  State<BookingMainScreen> createState() => _BookingMainScreenState();
}

class _BookingMainScreenState extends State<BookingMainScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Бронирование', style: BookingTextStyles.appBarTextStyle,),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SizedBox(
        height: size.height,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: BookingAboutHotelWidget(),
            ),
            SliverToBoxAdapter(
              child: BookingAboutTripWidget(),
            ),
            SliverToBoxAdapter(
              child: BookingAboutBuyerWidget(),
            ),
            SliverToBoxAdapter(
              child: BookingTouristListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}