import 'package:hotel_app/consts/hotelConsts/textstyle_consts.dart';
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
  List<String> images = [
    'https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg',
    'https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg',
    'https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Отель',
            style: HotelTextStyles.appBarTextStyle,
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: HotelImageCarouselWidget(size: size, images: images),
            ),
            const SliverToBoxAdapter(
              child: HotelRatingWidget(rating: 5, ratingName: 'Превосходно'),
            ),
            const SliverToBoxAdapter(
              child: HotelTitleWidget(title: 'Steigenberger Makadi'),
            ),
            const SliverToBoxAdapter(
              child: HotelAddressWidget(
                  title: 'Madinat Makadi, Safaga Road, Makadi Bay, Египет'),
            ),
            const SliverToBoxAdapter(
              child:
                  HotelPriceWidget(price: 134268, priceForIt: 'За тур с перелётом'),
            ),
            const SliverToBoxAdapter(
              child: HotelAboutWidget(
                aboutHotel: {
                  "description":
                      "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!",
                  "peculiarities": [
                    "Бесплатный Wifi на всей территории отеля",
                    "1 км до пляжа",
                    "Бесплатный фитнес-клуб",
                    "20 км до аэропорта"
                  ]
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: HotelButtonWidget(title: 'Steigenberger Makadi',),
            ),
          ],
        ));
  }
}
