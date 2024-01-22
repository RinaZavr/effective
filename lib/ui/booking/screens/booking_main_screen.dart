import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/utils/consts/bookingConsts/string_consts.dart';
import 'package:hotel_app/utils/consts/bookingConsts/textstyle_consts.dart';
import 'package:hotel_app/ui/booking/bloc/booking_bloc.dart';
import 'package:hotel_app/ui/booking/widgets/booking_about_buyer_widget.dart';
import 'package:hotel_app/ui/booking/widgets/booking_about_hotel_widget.dart';
import 'package:hotel_app/ui/booking/widgets/booking_about_trip_widget.dart';
import 'package:hotel_app/ui/booking/widgets/booking_tourist_list_widget.dart';
import 'package:hotel_app/ui/hotel/bloc/hotel_bloc.dart';

class BookingMainScreen extends StatefulWidget {
  const BookingMainScreen({super.key});

  @override
  State<BookingMainScreen> createState() => _BookingMainScreenState();
}

class _BookingMainScreenState extends State<BookingMainScreen> {
  bool? hasPhoneError = false;
  bool? hasEmailError = false;
  String? email;
  String? phone;
  late HotelBloc hotelBloc;
  late BookingBloc bookingBloc;

  @override
  void initState() {
    hotelBloc = HotelBloc();
    hotelBloc.add(GetHotelEvent());
    bookingBloc = BookingBloc();
    bookingBloc.add(GetBookingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          BookingStringConsts.appBarTitleString,
          style: BookingTextStyles.appBarTextStyle,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => bookingBloc,
        child: BlocBuilder<BookingBloc, BookingState>(
          bloc: bookingBloc,
          builder: (context, state) {
            if (state is BookingLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is BookingErrorState) {
              return Text(state.error);
            }
            if (state is BookingLoadedState) {
              return SizedBox(
                height: size.height,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: BookingAboutHotelWidget(
                          name: state.booking.hotelName,
                          adress: state.booking.hotelAdress,
                          rating: state.booking.hotelRating,
                          ratingName: state.booking.ratingName),
                    ),
                    SliverToBoxAdapter(
                      child: BookingAboutTripWidget(booking: state.booking),
                    ),
                    SliverToBoxAdapter(
                      child: BookingAboutBuyerWidget(
                        setEmail: (value) {
                          email = value;
                        },
                        setPhone: (value) {
                          phone = value;
                        },
                        hasErrorEmail: hasEmailError,
                        hasErrorPhone: hasPhoneError,
                        updateErrorEmail: (value) {
                          setState(() {
                            hasEmailError = value;
                          });
                        },
                        updateErrorPhone: (value) {
                          setState(() {
                            hasPhoneError = value;
                          });
                        },
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: BookingTouristListWidget(
                        tourPrice: state.booking.tourPrice,
                        fuelCharge: state.booking.fuelCharge,
                        serviceCharge: state.booking.serviceCharge,
                        setErrorEmail: (value) {
                          setState(() {
                            hasEmailError = value;
                          });
                        },
                        setErrorPhone: (value) {
                          setState(() {
                            hasPhoneError = value;
                          });
                        },
                        phone: phone,
                        email: email,
                        hasErrorEmail: hasEmailError,
                        hasErrorPhone: hasPhoneError,
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
