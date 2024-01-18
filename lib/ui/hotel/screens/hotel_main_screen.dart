import 'package:effective/consts/textstyle_consts.dart';
import 'package:effective/ui/hotel/widgets/image_carousel_widget.dart';
import 'package:effective/ui/hotel/widgets/rating_widget.dart';
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
            style: AppTextStyles.appBarTextStyle,
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ImageCarouselWidget(size: size, images: images),
            ),
            const SliverToBoxAdapter(
              child: RatingWidget(rating: 5,),
            ),
          ],
        ));
  }
}
