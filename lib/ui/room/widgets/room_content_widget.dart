import 'package:hotel_app/utils/consts/roomConsts/string_consts.dart';
import 'package:hotel_app/domain/models/room_model.dart';
import 'package:hotel_app/ui/room/widgets/room_button_widget.dart';
import 'package:hotel_app/ui/room/widgets/room_image_carousel_widget.dart';
import 'package:hotel_app/ui/room/widgets/room_more_button_widget.dart';
import 'package:hotel_app/ui/room/widgets/room_peculiarities_row_widget.dart';
import 'package:hotel_app/ui/room/widgets/room_price_widget.dart';
import 'package:hotel_app/ui/room/widgets/room_title_widget.dart';
import 'package:flutter/material.dart';

class RoomContentRoomWidget extends StatefulWidget {
  final Room room;
  const RoomContentRoomWidget({super.key, required this.room});

  @override
  State<RoomContentRoomWidget> createState() => _RoomContentRoomWidgetState();
}

class _RoomContentRoomWidgetState extends State<RoomContentRoomWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoomImageCarouselWidget(
          size: size,
          images: widget.room.imageUrls,
        ),
        RoomTitleWidget(title: widget.room.name),
        RoomPeculiaritiesRowWidget(
          peculiarities: widget.room.peculiarities,
        ),
        const RoomMoreButtonWidget(
          title: RoomStringConsts.buttonMoreTitle,
        ),
        RoomPriceWidget(price: widget.room.price, priceForIt: widget.room.pricePer,),
        RoomButtonWidget(size: size,),
      ],
    );
  }
}
