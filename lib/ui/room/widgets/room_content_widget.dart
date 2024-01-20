import 'package:hotel_app/ui/room/widgets/room_button_widget.dart';
import 'package:hotel_app/ui/room/widgets/room_image_carousel_widget.dart';
import 'package:hotel_app/ui/room/widgets/room_more_button_widget.dart';
import 'package:hotel_app/ui/room/widgets/room_peculiarities_row_widget.dart';
import 'package:hotel_app/ui/room/widgets/room_price_widget.dart';
import 'package:hotel_app/ui/room/widgets/room_title_widget.dart';
import 'package:flutter/material.dart';

class RoomContentRoomWidget extends StatefulWidget {
  const RoomContentRoomWidget({super.key});

  @override
  State<RoomContentRoomWidget> createState() => _RoomContentRoomWidgetState();
}

class _RoomContentRoomWidgetState extends State<RoomContentRoomWidget> {
  List<String> images = [
    "https://www.atorus.ru/sites/default/files/upload/image/News/56871/%D1%80%D0%B8%D0%BA%D1%81%D0%BE%D1%81%20%D1%81%D0%B8%D0%B3%D0%B5%D0%B9%D1%82.jpg",
    "https://gogolhotel.ru/images/r4.jpg",
    "https://worlds-trip.ru/wp-content/uploads/2022/10/white-hills-resort-5.jpeg"
  ];
  List<String> peculiarities = ["Включен только завтрак", "Кондиционер"];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoomImageCarouselWidget(
          size: size,
          images: images,
        ),
        const RoomTitleWidget(title: 'Стандартный с видом на бассейн или сад'),
        RoomPeculiaritiesRowWidget(
          textFirst: peculiarities[0],
          textSecond: peculiarities[1],
        ),
        const RoomMoreButtonWidget(
          title: 'Подробнее',
        ),
        const RoomPriceWidget(price: 186600, priceForIt: 'за 7 ночей с перелётом',),
        RoomButtonWidget(size: size,),
      ],
    );
  }
}
