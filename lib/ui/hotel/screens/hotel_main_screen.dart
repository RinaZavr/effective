import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/utils/consts/hotelConsts/string_consts.dart';
import 'package:hotel_app/utils/consts/hotelConsts/textstyle_consts.dart';
import 'package:hotel_app/ui/hotel/bloc/hotel_bloc.dart';
import 'package:hotel_app/ui/hotel/widgets/hotel_about_widget.dart';
import 'package:hotel_app/ui/hotel/widgets/hotel_button_widget.dart';
import 'package:hotel_app/ui/hotel/widgets/hotel_address_widget.dart';
import 'package:hotel_app/ui/hotel/widgets/hotel_image_carousel_widget.dart';
import 'package:hotel_app/ui/hotel/widgets/hotel_price_widget.dart';
import 'package:hotel_app/ui/hotel/widgets/hotel_rating_widget.dart';
import 'package:hotel_app/ui/hotel/widgets/hotel_title_widget.dart';
import 'package:flutter/material.dart';

class HotelMainScreen extends StatefulWidget {
  const HotelMainScreen({super.key});

  @override
  State<HotelMainScreen> createState() => _HotelMainScreenState();
}

class _HotelMainScreenState extends State<HotelMainScreen> {
  late HotelBloc hotelBloc;

  @override
  void initState() {
    hotelBloc = HotelBloc();
    hotelBloc.add(GetHotelEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            HotelStringConsts.appBarTitle,
            style: HotelTextStyles.appBarTextStyle,
          ),
          leading: const Icon(Icons.abc, color: Colors.transparent,),
        ),
        body: BlocProvider(
          create: (context) => hotelBloc,
          child: BlocBuilder<HotelBloc, HotelState>(
            builder: (context, state) {
              if (state is HotelLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is HotelErrorState) {
                return Text(state.error);
              }
              if (state is HotelLoadedState) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: HotelImageCarouselWidget(
                          size: size, images: state.hotel.imageUrls),
                    ),
                    SliverToBoxAdapter(
                      child: HotelRatingWidget(
                          rating: state.hotel.rating,
                          ratingName: state.hotel.ratingName),
                    ),
                    SliverToBoxAdapter(
                      child: HotelTitleWidget(title: state.hotel.name),
                    ),
                    SliverToBoxAdapter(
                      child: HotelAddressWidget(title: state.hotel.adress),
                    ),
                    SliverToBoxAdapter(
                      child: HotelPriceWidget(
                          price: state.hotel.minimalPrice,
                          priceForIt: state.hotel.priceForIt),
                    ),
                    SliverToBoxAdapter(
                      child: HotelAboutWidget(
                        aboutHotel: state.hotel.aboutTheHotel,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: HotelButtonWidget(
                        title: state.hotel.name,
                      ),
                    ),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ));
  }
}
