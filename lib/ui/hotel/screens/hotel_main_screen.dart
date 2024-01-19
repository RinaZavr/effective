import 'package:effective/consts/hotelConsts/textstyle_consts.dart';
import 'package:effective/ui/hotel/widgets/about_widget.dart';
import 'package:effective/ui/hotel/widgets/button_widget.dart';
import 'package:effective/ui/hotel/widgets/description_widget.dart';
import 'package:effective/ui/hotel/widgets/image_carousel_widget.dart';
import 'package:effective/ui/hotel/widgets/price_widget.dart';
import 'package:effective/ui/hotel/widgets/rating_widget.dart';
import 'package:effective/ui/hotel/widgets/title_widget.dart';
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
              child: ImageCarouselWidget(size: size, images: images),
            ),
            const SliverToBoxAdapter(
              child: RatingWidget(rating: 5, ratingName: 'Превосходно'),
            ),
            const SliverToBoxAdapter(
              child: TitleWidget(title: 'Steigenberger Makadi'),
            ),
            const SliverToBoxAdapter(
              child: DescriptionWidget(
                  title: 'Madinat Makadi, Safaga Road, Makadi Bay, Египет'),
            ),
            const SliverToBoxAdapter(
              child:
                  PriceWidget(price: 134268, priceForIt: 'За тур с перелётом'),
            ),
            const SliverToBoxAdapter(
              child: AboutWidget(
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
              child: ButtonWidget(),
            ),
          ],
        ));
  }
}
