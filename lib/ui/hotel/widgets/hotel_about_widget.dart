import 'package:hotel_app/consts/hotelConsts/image_consts.dart';
import 'package:hotel_app/consts/hotelConsts/textstyle_consts.dart';
import 'package:hotel_app/ui/hotel/widgets/hotel_about_button_template_widget.dart';
import 'package:hotel_app/ui/hotel/widgets/hotel_peculiarities_row_widget.dart';
import 'package:flutter/material.dart';

class HotelAboutWidget extends StatelessWidget {
  final Map<String, dynamic> aboutHotel;
  const HotelAboutWidget({super.key, required this.aboutHotel});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Об отеле',
                style: HotelTextStyles.aboutTitleTextStyle,
              ),
            ),
            HotelPeculiaritiesRowWidget(textFirst: aboutHotel["peculiarities"][0], textSecond: aboutHotel["peculiarities"][1]),
            const SizedBox(height: 8,),
            HotelPeculiaritiesRowWidget(textFirst: aboutHotel["peculiarities"][2], textSecond: aboutHotel["peculiarities"][3]),
            const SizedBox(height: 12,),
            Text(aboutHotel["description"], style: HotelTextStyles.aboutDescriptionTextStyle,),
            const SizedBox(height: 16,),
            const HotelAboutButtonTemplateWidget(image: HotelImageConsts.aboutButtonComfortImage, title: 'Комфорт'),
            const HotelAboutButtonTemplateWidget(image: HotelImageConsts.aboutButtonIncludedImage, title: 'Что включено'),
            const HotelAboutButtonTemplateWidget(image: HotelImageConsts.aboutButtonNotIncludedImage, title: 'Что не включено'),
            const SizedBox(height: 16,),
          ],
        ),
      );
  }
}
